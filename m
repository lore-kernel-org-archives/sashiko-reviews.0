Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988B449B0C
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501792; cv=none; b=HQEqr3tGQAMdW7ZTWhPk3h7QLc3K2Wc6oLTsmb9rBwMJjV0wReAd7Ccdj6bzwojgT3Gm02aPcS7Xe3lX8RSxquiE4EVCCFBkl+b6G/niZ5ZDD/BgdBoK4q5UMLvoYVX+vykpZS6YWjRnkCSVgVD2EPioBYtzPZWJJD8zZE5AnPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501792; c=relaxed/simple;
	bh=Ox+hNbTd7f3+G4o+Sw8Uzx0THm/NdMARd2zaTFBMXU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5wLNInD5Xx5ltRaG+7NZi/LQJr2MFbobU5OHtFQhdWvbYuPXvpW6Y5a4c9wWvsWb6UsVesoAGpzL/0hOtNf7340Win9yVOT+yppZEQi7QxVzmQa/GtvNHavZPqo7PeaQ9O/rqXFrafQjmiJYwmHxRn7CF27VevpUNbO++QZO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejgrnj0x; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejgrnj0x"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so149832a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501790; x=1790106590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=ejgrnj0xi+09QCCOVKDAy8BoOmM9uOL+66JFwUSPPOE7U5vrobaV95H/2ws8EmtMq5
         HiRVT1/pwT0JuRnmrotXcaRV44XcAldJaA8A8uOfh0vYYsLJDjoKPne+t+ZWgtP4awHC
         ENniknxMCsvbEX3cjcwbBl2EndDv8/XOZyH7gZjR9mhAV6IHLwrwE46DZpSF4kzAMKbb
         08TDMyOOzzLymJkJxxfMXFQAv3Nv2gzZbAjrpKeNIpzzV3eBy0nJ8sfBrDzy1Vy/wKHr
         o5bjIPfq3dTAzAzwBEPG5mvdMQn2MzcLHdnt2D/oWpWz7Axb5KoVvxVb895orNTb0nav
         eqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501790; x=1790106590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=VXIrsQ344fRGkF+T5pIegQyI8CEtm9k2a1shxfcoPyX7PQL6FkZjH8suseyrzerfmN
         yAOghdEULQU2udLje7aZZgWghCmiGMslG7J/VRPFgJqmL6dgfqFedSX84t1JJGW59euQ
         yooCZ24s34Lwmju6x/ulX+nwr7jxxhT6EgOaJmPvkETo5kX+IMmEmHfGWzjzWN4YDwKZ
         Wr00XJSRQLeRIc2r4NAfHKN6yt8M0k/0HiCkgNvPhZ3IVJVuq43SW7pQt+8tERZqllNp
         Ntra71ZZGIUXXc0poVCLSYH8IyxeewrHcJ7V2BpiKTwkcBTHqPUSts/CN16ljHtM0VyU
         Fuyg==
X-Gm-Message-State: AFuF++mBvm3TVG8VIwwVvLrE4uWkgMRCTJoEAKMiFBD4HlUGNguU2YkF
	fKiWSMw5+2Yuv+v9ZESiCE32KzAMa//QA8lgGoqFm5tORVDoTRNcnDCBN+AJa19f
X-Gm-Gg: AYBFou2ecoRdryS7HYVYXI6AWDRw3rQwT0cfDormhsliHEb9VtWJNK9Xla0r1Fzqn23
	ixPV6l75YhJHa5vngYtaFrWJrrvbWqcaF7elsLlEyHw3R1XbDVqBaCjK/CYIIJYYCS5ooHGyRV1
	CEx51Uytg/jbYf7ta8e1/o0MWHEnL6RlAaMBQSQsrK+tFTF1tYp53xToXKru4iEQcLiRwqTNVQb
	yXilfDvLlBPq3zlfCEFbW0K23vSTyaravsa23TQD2NjwdSiDgXq2tZSSZ/C0JwyAR1w6uUnQrmC
	sNZ1iCYWDDV0L1GBcno0K8dVcYDW8vd5+YfJUK8uPhuLVEERTIVpyaLam5Qvbv0ahq8bn8poqmV
	g0UaiQDdIwjthHm6jXMJ3bRz9g/l5OJWD3f6vKEStwITBQwuvCEjBD47IwmC7MRQTsqXZuWjkGY
	GQPSh20rK1SXMKvXJk/UyYm269vugTj/Zi7eDch23CGMkJRdxvD4tU9Ec5GwWa8cdvV1b2tAgoG
	jVeiW4tWixw032WMpkEG5a5bVAm68BY+dGcYr1i/huescO89viHJh4=
X-Received: by 2002:a17:90b:1f84:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1b0c5c9dmr789092a91.0.1789501790027;
        Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm821075c88.11.2026.09.15.12.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:49:49 -0700 (PDT)
Message-ID: <583fd625-b57f-44be-96c8-94d981c29c79@gmail.com>
Date: Tue, 15 Sep 2026 12:49:47 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
 <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/12/26 19:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `oneOf` constraint incorrectly makes `ent-gpios` and `vin-supply` mutually exclusive and strictly requires exactly one to be present, contradicting the claim that `vin-supply` is optional and artificially restricting valid hardware configurations.
> --
make ARCH=arm CHECK_DTBS=y DT_SCHEMA_FILES=richtek,rt8515.yaml \
       qcom/qcom-msm8960-samsung-expressatt.dtb \
       st/ste-ux500-samsung-codina.dtb \
       st/ste-ux500-samsung-codina-tmo.dtb \
       st/ste-ux500-samsung-gavini.dtb \
       st/ste-ux500-samsung-golden.dtb \
       st/ste-ux500-samsung-janice.dtb \
       st/ste-ux500-samsung-kyle.dtb \
       st/ste-ux500-samsung-skomer.dtb

all 8 in-tree users of this binding. 0 warnings.

existing hw passes. Probably not useful to account for hw not in the tree



>
> commit 72463777ee1c18e7913b350d5d2ad857810ece89
> Author: Rudraksha Gupta <guptarud@gmail.com>
> Subject: dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
>
> This commit adds support for single-channel variants of the RT8515 flash
> ICs. It makes ent-gpios optional and introduces a vin-supply property,
> adding a oneOf constraint to manage their presence.
>
>> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> index 0356371a6b014..ab3c5139132cc 100644
>> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> [ ... ]
>
>> @@ -81,10 +90,15 @@ properties:
>>   
>>   required:
>>     - compatible
>> -  - ent-gpios
>>     - enf-gpios
>>     - led
>>   
>> +oneOf:
>> +  - required:
>> +      - ent-gpios
>> +  - required:
>> +      - vin-supply
>> +
> [Severity: Medium]
> Does this oneOf constraint incorrectly restrict valid hardware configurations?
>
> The oneOf constraint strictly requires exactly one of its subschemas to match.
> If a single-channel IC (which naturally lacks ent-gpios) does not use the
> explicitly optional vin-supply regulator, zero subschemas will match, causing
> schema validation to fail.
>
> Conversely, if a standard dual-channel IC (which requires ent-gpios) is also
> powered by a vin-supply regulator, two subschemas will match. This will also
> fail validation due to the strict exclusivity of oneOf.
>
> Should this be modeled differently to allow vin-supply to be truly optional
> while safely permitting single-channel configurations?
>
>>   additionalProperties: false
>>   
>>   examples:
