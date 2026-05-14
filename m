Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com [45.254.49.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F373CAE65
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778744612; cv=none; b=RE1owChMd3gl+lr8eke8ipUjiSX4ifWlsHkxwpp4vvNjgBeDp1oKafmzPe/8kMBUfldDSClOn2bRMhOylKyXyueYmEaMkVYOjUXIhmKWIeLUhevvBTdqxM0JTXJEC6u8TNJe//7TPEEpAbh1ETLZBxG4rEv9qKP0Taq3rIMaqyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778744612; c=relaxed/simple;
	bh=IoKzoM6/Z57dXqLNaplXe0EQEP1kl1tN6XhAwdBSJ+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AD20oBiodw9dHGcTfpyHYmFFalmgRw9wQuE/1J9+x5fTTn88xpBYxpwQyuqjlhWdrvxFgb7VEZSWnbPiZ9cx7+kN7PrdLxUjvBCd7b/f65A46C1RngSun5SNt5/A/Xc1OKrtjyYaVlfxA2J4YeaYbS5JnSM059jJwEeZLs1vmeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WxGzprOz; arc=none smtp.client-ip=45.254.49.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WxGzprOz"
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e63187bb;
	Thu, 14 May 2026 15:38:08 +0800 (GMT+08:00)
Message-ID: <58e9a6d9-b77a-45aa-8d39-294399c85cc0@rock-chips.com>
Date: Thu, 14 May 2026 15:38:08 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] dt-bindings: display: rockchip: analogix-dp: Fix
 hclk as third clock for RK3588
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org
References: <20260513074414.2053435-2-damon.ding@rock-chips.com>
 <20260514025123.D758DC19425@smtp.kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260514025123.D758DC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e256be58903a3kunmb52ad2ddc771c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTB0YVhhKGkhCSkseTh5MTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WxGzprOznWAUfFWi3nrZyyRpBA3fSwzGiYboygkNyTi/qSLy4D5JQ2vx+AdIaIq/KWF26XDTQ5jg85WIXV14mz2xhk0PwNgCHdtJ3h2AFLZsKDJmCvuSkggvxKADL/iraVezQw/ffN4KsxRm31HK1lPlZ9zrZcZJgEpI9TN0WJ0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sQ3BCKjfz52siRf7KbRAMx4SaiJ9IA0GFI5jrZL+0IY=;
	h=date:mime-version:subject:message-id:from;

On 5/14/2026 10:51 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The device tree schema fails to correctly enforce the required number of clocks in the conditional blocks by omitting `minItems` and `maxItems` constraints.
> --
> 
> commit 1eeef10904ab6c1e09008c1f85fab2353dd23f79
> Author: Damon Ding <damon.ding@rock-chips.com>
> 
> dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
> 
> This commit enforces a third clock name on a per-compatible basis for
> the analogix-dp driver. It removes the implicit clock enablement from
> the GRF phandle and explicitly defines the clocks required for each SoC.
> 
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc59..8001c1facf986 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> 
> [ ... ]
> 
>> @@ -60,6 +57,33 @@ required:
>>   allOf:
>>     - $ref: /schemas/display/bridge/analogix,dp.yaml#
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3288-dp
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
> 
> Should this block include maxItems: 2? The top-level schema defines
> maxItems: 3, which might allow a device tree with an extra unvalidated
> third clock string to silently pass validation here.
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3399-edp
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
>> +            - const: grf
> 
> Does this block need minItems: 3 to ensure the grf clock is actually
> enforced? Because the top-level schema allows minItems: 2, a device tree
> omitting the third clock might still pass validation.
> 
>> +
>>     - if:
>>         properties:
>>           compatible:
>> @@ -68,6 +92,11 @@ allOf:
>>                 - rockchip,rk3588-edp
>>       then:
>>         properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
>> +            - const: hclk
> 
> Similarly, does this block also require minItems: 3? Without it, the
> hclk requirement might not be strictly enforced if the schema validation
> falls back to the top-level minItems: 2 allowance.
> 
>>           resets:
>>             minItems: 2
>>           reset-names:
> 

After adding the maxItems and minItems as AI suggested, there are some 
warnings via:

make dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml

/home/ding/drm-misc/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: 
allOf:1:then:properties:clock-names: {'maxItems': 2, 'items': [{'const': 
'dp'}, {'const': 'pclk'}]} should not be valid under {'required': 
['maxItems']}
         hint: "maxItems" is not needed with an "items" list
         from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/home/ding/drm-misc/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: 
allOf:2:then:properties:clock-names: 'oneOf' conditional failed, one 
must be fixed:
         [{'const': 'dp'}, {'const': 'pclk'}, {'const': 'grf'}] is too long
         [{'const': 'dp'}, {'const': 'pclk'}, {'const': 'grf'}] is too short
         False schema does not allow 3
         1 was expected
         3 is greater than the maximum of 2
         hint: "minItems" is only needed if less than the "items" list 
length
         from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/home/ding/drm-misc/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml: 
allOf:3:then:properties:clock-names: 'oneOf' conditional failed, one 
must be fixed:
         [{'const': 'dp'}, {'const': 'pclk'}, {'const': 'hclk'}] is too long
         [{'const': 'dp'}, {'const': 'pclk'}, {'const': 'hclk'}] is too 
short
         False schema does not allow 3
         1 was expected
         3 is greater than the maximum of 2
         hint: "minItems" is only needed if less than the "items" list 
length
         from schema $id: http://devicetree.org/meta-schemas/items.yaml#
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.example.dts
   DTC [C] 
Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.example.dtb

Best regards,
Damon

