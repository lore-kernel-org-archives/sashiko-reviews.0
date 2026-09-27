Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380BF3911DD
	for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522065; cv=none; b=ZjBMKBGu6QvVh7FgVf4WufoJm8nuTf70r6Ebp2xFpacgPXltj/PThSQzGb4JWABwF8AjjVKZDKbWCDAnd4M986/BrDnC9xtQMl0J5C9PBNT2huR91sS/KzAFj0DEWt5pG0kZ3VuiBC4e5tpfD8jGEI6+z6vlMzLYCGUamTRzA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522065; c=relaxed/simple;
	bh=hsCJIQkqYuxFzzbKYzyukNxXPC64YPMx0HDRYYGxtJA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GsmtrNQ4uEGDPf0N7t5MVmHAWDbmf+XOdllJHzwqYEgQ7JpfRteKp+zqohYxUb4KfYL2KZBuNrtTmPvKc0L/p5lvVHewsOTFpWtTJhwL8HBkQP8UipGUUkGRcKIXR1B535YCQeNdzhBjr0otAh4ivE0OW/vrAj3/t6b4SCxaybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=eMsUfNsi; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="eMsUfNsi"
Message-ID: <c93092bb-e3f7-462f-aa8f-a09dbb2946e9@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790522058;
	bh=hsCJIQkqYuxFzzbKYzyukNxXPC64YPMx0HDRYYGxtJA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eMsUfNsi9SLtEDWRzSc6H2xwtcuEkvZM0fjvkGTmN3kyBg48Jq1TeTFreNDZioqbx
	 fUO3oePYrrKsJZlUfDnsoMK28FzwbUsl7R3BJG7f1/+N2nClkuk3RTFDpxqD7WDlPZ
	 gqKY+99yDBieJS6MuqfPndZ28xeSCHaB1QJllZN0=
Date: Sun, 27 Sep 2026 17:14:17 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
 <20260927143733.DA8151F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260927143733.DA8151F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/26 4:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: pwm-amlogic: missing minItems allows validation bypass
> --
> 
> commit 359e122eac15df570817ba590b91f8958522a038
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> dt-bindings: pwm: amlogic: Add core clock for S4 like
>     
> This commit adds a third system core clock to the Amlogic PWM controller 
> bindings for S4 and related devices. It updates the conditionals for the 
> S4 compatible string to require three clocks instead of two, and updates 
> the examples to match.
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index c337d85da40f1..e9cd5f1fdf264 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> 
> [ ... ]
> 
>> @@ -143,9 +143,15 @@ allOf:
>>            items:
>>              - description: input clock of PWM channel A
>>              - description: input clock of PWM channel B
>> -        clock-names: false
>> +            - description: gate clock for the PWM controller
> 
> [Severity: Medium]
> Will dt-schema successfully enforce the minimum 3 items requirement intended 
> by the commit message?
> 
> Because the global `clocks` property definition has `minItems: 1` and JSON 
> Schema's `items` keyword only validates elements that are actually present, a 
> device tree node with `compatible = "amlogic,meson-s4-pwm"` and only 1 or 2 
> clocks will silently pass validation.
> 
> Does this block need an explicit `minItems: 3`?
> 

If I remove one clock, the validation fails

```
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dts
  DTC [C]
Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb
  DTC [C] Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@1000 (amlogic,meson-s4-pwm): clock-names: ['channel-a', 'channel-b']
is too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@1000 (amlogic,meson-s4-pwm): clocks: [[4294967295], [4294967295]] is
too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@60000 (amlogic,t7-pwm): clock-names: ['channel-a', 'channel-b'] is
too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@60000 (amlogic,t7-pwm): clocks: [[4294967295], [4294967295]] is too
short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
```

>> +        clock-names:
>> +          items:
>> +            - const: channel-a
>> +            - const: channel-b
>> +            - const: core
> 
> [Severity: Medium]
> Does this also require `minItems: 3`?
> 
> Supplying just "channel-a" and "channel-b" will still validate successfully 
> without a `minItems` constraint here.
> 
>>        required:
>>          - clocks
>> +        - clock-names
> 


-- 
Best regards,
Ronald
