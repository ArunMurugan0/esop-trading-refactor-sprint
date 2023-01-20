package com.esop.dto

import com.fasterxml.jackson.annotation.JsonCreator
import io.micronaut.core.annotation.Introspected
import javax.validation.constraints.Max
import javax.validation.constraints.Min
import javax.validation.constraints.NotNull


@Introspected
class AddInventoryDTO @JsonCreator constructor(
    @field:NotNull(message = "property quantity is required")
    @field:Min(1, message = "quantity has to be greater than zero")
    @field:Max(MAX_QUANTITY, message = "quantity has be less than or equal to $MAX_QUANTITY")
    var quantity: Long? = null,
)