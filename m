Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670C3A3830
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832948; cv=none; b=Sa/1r6ETthFfcudLnKeZvWkCyCkKlPCN0pKLYpsVtm7Lt8EmrzpjWAuRHSV9rDJ07Y1W1Yv3zEaH9qmnrVvFVtHQNKHCg00LpGBEWxqoHY0swUnNTQGLsTB2TqY6HyLa61So+i2DzFE2ZvcpgWbX8K5MzcU8EG/GKxarBG0aJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832948; c=relaxed/simple;
	bh=I2wtVNaS6o8OAlaYlTFNdpKbih1U/K2t30+mfEc/Lzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZ/aj9wa6V7ap0rXdgHs3jdFKpc4tKf+twQu0mabzCFnztQlzub8eTtKd1pThlgBsJzTifqBIdYyLyeFtOnSOAG3kEsjPHNDWTWgJEheSWX6dYHyQHer+rqEpvrwYsJTEOsS8iyDFQwn1UQMqyKS3nPscPmWrOCCUwJHFNkClMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=C3qbTAU0; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="C3qbTAU0"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93a40a9a01aso922671285a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791832945; x=1792437745; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJkDBXWfZLgUvuIwsHhYgMkJTX4QEfwRoh/VVYHOAu4=;
        b=C3qbTAU0t4WJeoryiPxsTdFVGWofqhWb8FhvOPaQBJaHUunmP85fVqDSSLq5jGPbQm
         VHjQaGUpy+T3gjDrhxwMIL6/MBjvECpqgn3jJYTGywPkvXxtkDi0+Z0abkoOnhPNSZRQ
         IVv8lBZsZ3yUC6HFnwtOr8dusFAnl38ALvjiQbvLfOyf+bUJpAJ+jIyaASivRtDLPflh
         kzUapZl7eG7qxxowcWp0+8nxHwzEKCuHBJkJZ5CvEXRIuKzuAbM4qwFiIw8GCsgLSiTY
         orWzh8FxWW/cYM3NMsfQTbT38F1DFocl7vyn0JS60Pb5jZyEjTVoRzDo7BsOOAX07mhJ
         LsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832945; x=1792437745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJkDBXWfZLgUvuIwsHhYgMkJTX4QEfwRoh/VVYHOAu4=;
        b=gJ4L8hXK2DkfDwNhvbdsTfysEQSBaQrSDk43DFvDE5bC1id6yhn4nSVa8KhdynrFz+
         F7PEYT+Nj4HlZzsE66iyE0vi88mPsyQlxgWVR3fnPZY9BLh4Q+lqcD8+vFxsy679luIv
         5IKqm+LOnQLxvUnLgko2TWCG9vXnkYtav0tiggQVJpOLTfApVdGK5xEgK1L2+PnroH/e
         zG9ZqB2O3HJ/xK9rXqRQ1svUuVOLEc2QYPQu8UMXudoldvcSJnZjGwfE2PTASqcMn4HS
         xdHpzMi3U8hefaNkGqaSzcsLU878b37SikfiZqfKZiH0ZHt63uLrbjkNFyegvBgXrNHC
         vNbA==
X-Gm-Message-State: AFq9FYJQl9YmZcZh+WWa85qIvhOIXKRCOif8XJyryd5mXm4Gbs7KML6K
	SdcRZVOkMtxR/1PNnd+QAxrLuumdDzbU/po5XgdvqBif7n9h+p2qZ5kSLlYw3C8f3aby06KPFoG
	/P+epIKI=
X-Gm-Gg: AYBFou134/I12qnxMTuItHVxleL51yyX+JfJRwB0pLmLFezfflJsDhBS+o//urz3Qm3
	TUmx+Shjd8nmgPGNrHC928sP5R3s4p4V6aoUSZEXxlynMRxS5OCmBNu+q9bmZdzm04LBaSYncpP
	R+gjv7xRy0orpn4puXYVi9y5JesMwLwA+bpvMqA78WpRsPcXTQ70u4PjwCFzlC6F/eO/l9+jLxJ
	bkOPtXuiGyEO6rmDd/ao50nynh+FGf9DrcKnNgPy13qE+79ZqYvjCOYLVIhc1NGpe8D53ExKeJG
	6HJ3Z1TPOwiuNfKA33m452dhADu6KbjO0R9x8+PWNiUCzuax67VLYRYlPIoTun/LEqCzjwgSAQz
	6nXMVbs9MLPQGGsuj7I1T7OYO+GkNU/Lgz3MGf9dFd10oYXF7hQm2HquNYJvlVSnh6HVulIZ709
	iVjPoSkZcfnx4QqOathe0s3au6FbXWAdZp6ubHWYv4hnJ1frcz8HCfm0la/ZnOZ1v5sPZmOyA=
X-Received: by 2002:a05:620a:46a4:b0:939:b0c8:b068 with SMTP id af79cd13be357-93ec1465512mr1488249785a.16.1791832944960;
        Mon, 12 Oct 2026 12:22:24 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5042696sm59469685a.26.2026.10.12.12.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 12:22:24 -0700 (PDT)
Message-ID: <fd8e30a6-107a-44ae-a268-f077a6f498ef@riscstar.com>
Date: Mon, 12 Oct 2026 14:22:23 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <sashiko-outbox-168565@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168565@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 2:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] dt-bindings: missing mandatory clock and reset properties in required list
> - [Low] dt-bindings: non-existent header includes cause dt_binding_check failure
> - [Low] dt-bindings: maintainer email addresses mismatch between MAINTAINERS and schema
> --
> 
> commit 8cfa6ac36f149ea1d1b37b717117b76943010968
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: interrupt-controller: introduce toshiba,tc9564-msigen.yaml
> 
> Define the binding for the MSIGEN interrupt controller present in the
> Toshiba TC9564 SoC.
> 
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
> [ ... ]
>> +title: Toshiba TC9564 MSIGEN Interrupt Controller
>> +
>> +maintainers:
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +  - Alex Elder <elder@riscstar.com>
> 
> [Severity: Low]
> This isn't a bug, but is this email domain mismatch intentional? The
> email addresses listed here in the schema use @riscstar.com, but the
> MAINTAINERS file entry added in this same patch uses @kernel.org.
> 
> This might cause automated tooling to route patch series to incorrect or
> duplicate addresses.

Daniel and I are doing this work on behalf of RISCstar, but we
use our @kernel.org addresses in the MAINTAINERS file.

danielt@kernel.org is the same person as daniel@riscstar.com
elder@kernel.org is the same person as elder@riscstar.com

(We should both send updates to the .mailmap file...)
> 
> [ ... ]
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
> 
> [Severity: Medium]
> Should clocks and resets be included in this required list? The binding
> documentation specifies that each MSIGEN uses a gated clock and reset line.

In the code, the calls to the clock and reset are not optional, so
yes, these should be required.  I will update this in version 2.

> If they are omitted here, device trees with incomplete hardware configurations
> will silently pass schema validation, potentially leading to driver failures
> when attempting to ungate clocks or deassert resets on uninitialized hardware.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/toshiba,tc9564.h>
>> +    #include <dt-bindings/reset/toshiba,tc9564.h>
> 
> [Severity: Low]
> Does this cause make dt_binding_check to fail? It looks like these header
> files are not included in this patch series.

I just checked, and yes, in fact this does cause a failure.

I did check this, but it was in my test environment that includes
a bunch of other drivers, etc.  These two headers come from two other
series that are currently out for review, and I neglected to mention
this.

I'll try find a better way to handle this for the next version.

					-Alex

> luding headers in the YAML example that do not exist in the source tree
> will usually cause the C preprocessor to fail during schema validation
> compilation.
> 
> [ ... ]
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
> [ ... ]
>>   F:	drivers/media/i2c/tc358743*
>>   F:	include/media/i2c/tc358743.h
>>   
>> +TOSHIBA TC9564 MSIGEN DRIVER
>> +M:	Alex Elder <elder@kernel.org>
>> +M:	Daniel Thompson <danielt@kernel.org>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
>> +
> 

