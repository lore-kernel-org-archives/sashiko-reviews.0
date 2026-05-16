Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB2191;
	Sat, 16 May 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959949; cv=none; b=E8LcJJ/mOyQm6SFYDBc30Fj4M9Ogue0aithuyYrdWDYSxO9MEl1dlXj6Dhj+eeRJBbFmQjJU3NVs3HiXAQSiBQtUE7tlEnBcnSBgbCYUYNfcgvwrXoL6Bj2F8u3V3Q2US+FjIoqLq4Tf+S3wb/Lnqv1hzC+pZ3sHshDuy2oIAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959949; c=relaxed/simple;
	bh=y2QxKdp0IpJbIPuJXX2Q8Xyf7FvOXID9Znadskk+T80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZy1tk5HHfjEQEVEhY0Tg0vQjCypBvCU9FpmlgrWRjuQW4gW+mpLPpdbpngd0n6j43c3PLZIhcn9sdhSDJGf3b7WS3vLZS8z3h9hbIw1VR+z7URJJdKQC5BvpneCcN6og5SmFWZfdsuzhWcLKlHlIyKDTgYL/phxOaZ0jmM+B/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3q5Gbpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3q5Gbpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C9AC19425;
	Sat, 16 May 2026 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959948;
	bh=y2QxKdp0IpJbIPuJXX2Q8Xyf7FvOXID9Znadskk+T80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3q5GbpwVWahnZf+64yR7Qyv1KjOAXFoNOBXnB97sojhFVKmdV8zOGCw/+roNFxWT
	 rzPc/nIxpy6Ry35fjVjjvfkmIaCU1Qc1lj+zwsASjMp2ip33zNJ1hEdJoKdoiuxErG
	 qFxkx9gUBwPY9QKm5un6eP7p6MaCK0rfmx+fhnkYbvW2ytnPr1LvPHN7jKhxmb2TUL
	 /D5IJVNqkTdwPL2b7Ba/WuN5KLsfriSJmJ2tWU6smfhdfjGAQMgklWLVpWzMoeCLfx
	 zq8nh4GvoDZX/A5zflSDf21hSBaFEWK7aOLN9KmvTP95a8kwAw95TyYOFPjGWJsZAc
	 Lg542v3NAsYdQ==
Message-ID: <f77eaf7c-72c1-4646-b412-733b566d3643@kernel.org>
Date: Sat, 16 May 2026 21:32:25 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner
 A523
To: sashiko-reviews@lists.linux.dev,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-sunxi@lists.linux.dev, conor+dt@kernel.org
References: <20260516-sunxi-a523-gpadc-v3-1-a3a04cff2620@mmpsystems.pl>
 <20260516055003.3F014C19425@smtp.kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260516055003.3F014C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2026 07:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Brittle schema conditional matching for compatible string
> - [Low] Missing device tree example for the newly added A523 variant
> --
> 
> commit 8ef795d51c1bc739366c917fc7bb2c4c8c5c937c
> Author: Michal Piekos <michal.piekos@mmpsystems.pl>
> 
> dt-bindings: iio: adc: Add GPADC for Allwinner A523
> 
> Add support for the GPADC for the Allwinner A523, which introduces a
> second clock compared to previous generations.
> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
>> index da605a051b949..6467800d30e27 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - allwinner,sun55i-a523-gpadc
> 
> Could this conditional matching be brittle?
> 
> Using a strict enum instead of contains: enum will fail if a future
> hardware variant uses allwinner,sun55i-a523-gpadc as a fallback string
> in an array. Would it be better to use contains: enum here to ensure
> standard extensibility?

Nitpick. Code is correct. Sashiko prompts are asking to skip nitpicks so
why do we deal with this?

Really the quality of Sashiko reviews for DT at least deteriorated or
was always poor but I just did not notice :(

> 
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Bus clock
>> +            - description: Module clock
>> +        clock-names:
>> +          items:
>> +            - const: bus
>> +            - const: mod
>> +      required:
>> +        - clock-names
> 
> Should an example be added for the allwinner,sun55i-a523-gpadc variant
> in the examples section?
> 
> Without an example, it appears the new constraints for the two clocks
> and the clock-names property will not be tested during dt_binding_check.

Again crappy Sashiko reasoning...

Best regards,
Krzysztof
