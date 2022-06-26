package team.stu.cnote.config;

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kamifeng
 * @date 2022/6/24 12:04
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket createRestApi() {

        return new Docket(DocumentationType.SWAGGER_2)
                .enable(true)
                .pathMapping("/")
                .apiInfo(apiInfo())
                .select()
                // 不扫描 /error，即不扫描系统默认的error接口
                .paths(Predicates.not(PathSelectors.regex("/error.*")))
                // 扫描全部
                .paths(PathSelectors.any())
                .build();
    }
    private ApiInfo apiInfo(){
        return new ApiInfoBuilder()
                .description("云笔记系统的借口文档")
                .title("CNote接口文档")
                .version("1.0")
                .build();
    }
}
