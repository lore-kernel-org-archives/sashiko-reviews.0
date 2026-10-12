Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994548EC8A
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824497; cv=none; b=Xk9qeiHgjVnJF7j2+myMEaXOa4ukpHJxr16DR5yQcrPXF2Z1rE4U8PMpEL54d6w8R4wLzGariasVmvTZKRBNNUuF/vojRwSQjmGNMF0+Vf8nvutddZ6uw0D9N+0xYC9ajNwuxfVb1qM0HVeorp9hk2M45j2z92DI80Ns5baPodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824497; c=relaxed/simple;
	bh=rZNYSXMqrn0GxiCZb4XSIaPOfilJGvalM6+xmVDt7+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=py8h2qx2Ix2xn31CTgecmm/b/jRvKVxM5261Gs8r1oxuk0Q3PThV96p8Kz8pMsdrqE+IlYwURGtABIJ0bGDqJ7kRihxIWQjmRUAG2cWcvhrRULffly6q2HZE4SKWDZ4Le3K0Io3qTb5lglK1ZjHmZBU4jeT6xIki0k+DIIKD70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EsPqCn+a; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EsPqCn+a"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9178aabd30dso22337426d6.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791824494; x=1792429294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IBoroqX0yymjVNw3YzKwxIQ75HHooWwrz0PZ7J/ZT8=;
        b=EsPqCn+aV1vpsET0Ek4uyb9hniGjMURib3PlHbl3o9VeOfVtsV3toekYKu4s4H1Ptt
         378XDpZvW8PYtjL9enQuIDyvLIYS6gs6hH/UFG1avurZ3budKwwO4W9FOA2BzMabiGX4
         WFGzYMPgkZOJQYJ52ydct31BPrxRDBcEiVHmRozUot8GPwQWrObYfdnRQhbro7l7ISut
         j1WsUC9eEW4Vig85R62m0JxBkGxEbMOBz58FtGfB6Y1fTHJPqUNJVMUPj3P6KwBar1H1
         W1jbkOBNFDCOBqClED7i21JGH9cF3aQPoJbrA6yvrI3M8EcFM5lhtan5FmyUlMNkjtPm
         Y95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824494; x=1792429294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IBoroqX0yymjVNw3YzKwxIQ75HHooWwrz0PZ7J/ZT8=;
        b=gLoRvaGZNw2X8GPxEUGkV+Ag+LRqda4r3kQ0SW946KIB0Oj7kScqRkKoHAuO+laLQL
         SiPpbiGh1l925teW2kqcL7JDoa2FdWGHZDyrcBgIp1GiiL0mXgmm07b0nlFUf7m88gUo
         +xML7sb/OXstqzvTZMfp5sTeRiRspKOAjR4bZPMP+Xk+kxOv3to/VUv1h1Ma+hkH9sXK
         uEFiQH2QVj/eW97eNLCm5P/kt/AOohvkwXdE6hUUO0q1EUjoJIenQPQx0yDPUB1Xvcm0
         cbfnB5dp77vQ0ofBH3QsmArgxk/7ZgIfe/U40F2o/p36QyocBO33Li6RQl94Ty8s4orX
         6Fcw==
X-Gm-Message-State: AFq9FYKWwCB0uEyDrij5l3RcZy1tjmlaSwLDbMQM9Z/QgyyPUGBaCyrZ
	L6wokeaG/et1iXnrm0pBSLhuD+zEytqacRg0DtQnxgdDJRBSfM9Qi+bJ6Xu159UchdzqVsq2bVl
	ADpDWSzo=
X-Gm-Gg: AYBFou0+I1+pJygJpaCHPmqJ7t/aTLzpi84OvEa7fFVLyayikh6GHJMNEYfAN06wYvc
	OMXtUR4K7JHs1BDvsnMrO6MCC8ISti707QAHuZKUpyZ4sDizWwMCSP6kjio7GCUQ9GEOnsj5doy
	zA2MEqLwiocR7SzNX8yWfhogBXcjx0KOT78Ijdw8pEMLVcQDuOIw2T31cD0l/0LWUYyBNie7MU5
	sNKlfY4Z/+qegfoEbd0wVkLr9DaV69jbt5iQGD4za1Zd5wB1j1ReUJUv3yTX5VYoIVrRyW76FdF
	bd1lRCzH6DBuye5amJ8h3wriyS4ztY+n4IoucaAMpjVDgcOaHB1M6ipXSnQrngpsqXfrMfiIIr8
	xxtUtURRpeUcgRQiz9PlAOihXHI/Z8X99UvID6nZUmzHWRArdXHLxta+oZFl7S/gQkJiDTGpkS+
	NAKufVhVRgJXiUvSENivKQ+1CPPxTWwq+htNNra5ofoSmzMN9T5rRFm3Ftvj5oIAYPPZmWBP8=
X-Received: by 2002:a05:6214:ca4:b0:91b:5d3b:4abf with SMTP id 6a1803df08f44-91b5d3b4de1mr165556636d6.52.1791824493549;
        Mon, 12 Oct 2026 10:01:33 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm2108436d6.48.2026.10.12.10.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:01:33 -0700 (PDT)
Message-ID: <da75c8e4-cf45-49c5-86c6-4fd8151683e2@riscstar.com>
Date: Mon, 12 Oct 2026 12:01:32 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <sashiko-outbox-168431@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168431@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt-bindings: syscon missing hardware-specific compatible in example
> - [Low] dt-bindings: incorrect node name 'reset' instead of 'reset-controller'
> --
> 
> commit 86eb967be387fadac7b22aba279d8ed01983af26
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
> 
> This commit defines the binding for the reset controller functionality present
> in the Toshiba TC9564 SoC. It includes a new YAML schema, a header file for
> the reset IDs, and updates the MAINTAINERS file.
> 
>> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/reset/toshiba,tc9564.h>


Unfortunately I hadn't noticed this before I sent it.
Krzysztof pointed out in the clock series, including this
here is unnecessary, because its contents are not actually
used in the example.  I will remove this for version 2.

>> +
>> +    syscon@0 {
>> +        compatible = "syscon", "simple-mfd";
> 
> [Severity: Low]
> Does this example fail dt_binding_check validation? The core syscon.yaml
> schema typically requires a hardware-specific compatible string to precede
> generic fallbacks like "syscon" and "simple-mfd".

It did not fail dt_binding_check validation for me, however I
am rarely surprised to discover there are errors in my bindings...

>> +        reg = <0x0 0x2000>;
>> +
>> +        reset {
> 
> [Severity: Low]
> Should this node be named "reset-controller" instead of "reset"? The core
> reset.yaml schema enforces the ^reset-controller(@.*)?$ naming convention
> for nodes providing resets (identified by the #reset-cells property).

Yes it should.  I corrected this in my private DTS file but
neglected to correct it in the binding example.  I will fix
this when I send version 2.

					-Alex

>> +            compatible = "toshiba,tc9564-reset";
>> +            #reset-cells = <1>;
>> +        };
>> +    };
> 

