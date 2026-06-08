Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3032EAB61
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925265; cv=none; b=GOpN/ol6BTPfi1jSjhiy0lzqwVecXZ63dwykFWkUYfEVyXeNgkzs7wxHw147iNraFxDwoQDyREHTqw9WGoi918k0z3qYxmKp1Ih/ktWr5Zm2P133S3GI4nGMzLqYiqkiiqLdUPAP4URIOMX3bQiT1MbSX2iFS5j9HtwRo+h0yRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925265; c=relaxed/simple;
	bh=yT6xHVxLZk0upCiR71weeJ3YTpFaCRjAee8PNhOeWBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNvB16VUBgYBVDyE+k+DJhnJq7pD7NMFAp0e1j1sjy5zLuYg19qsfWke48C9IJLkZVXI8fTHgTnYWjVP9vAoMi5nR/HSIE3Tb00LuCLN7Mz4GzW7QlRzmfyJKl3aQhuplgP9RhUU0sWHD7xe9KdXl7pkVmUVC9ApEFtlN4tbPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRkyV9HG; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRkyV9HG"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d7f31215so3604191eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925263; x=1781530063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8q9Y3dkb4+nYxO7LN8VFVjV8kgwP5XnZvXClRTD2SY=;
        b=XRkyV9HGCI+S18WDokqqrzrHAMIGA4UUrrF8yHYr2kYUaPDreiq92C35+pEDVxbUzw
         jeFrkxZ+tFtdABGFgV7q4LNj8Il2E+liP5Pr02EmAtnq3w4/wsLH4lHNS/VHSXnwLzC/
         rdw53UaRdUEVgjhJpT+ovYfp3mZrhfsKHjs3I/Wul43x7bQwriI+jLOFi2dPZSbHlg/+
         8RTq4hZX/Nd8nCH/DMaYmLfayANjzaGGpfvoMRSjnP6GgM5SNr9RltUvQMriEvAp5WVh
         o2IwHG/e9rQTsntKwKWOoLh5Dgb+rZZc9s8pRzeWIFZanEABmkRaCgRVUcaS5WQZKwgd
         7uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925263; x=1781530063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8q9Y3dkb4+nYxO7LN8VFVjV8kgwP5XnZvXClRTD2SY=;
        b=AJrYKxhwxL9PUPmaM9qmGmgaHQtnmwh/5N4sbAIUTI6MSny41k0RCh0EaaOwBfDlZd
         6rpwaLOwJOhg4yjWx8M+cVn7zeQ0a0BEojHCAgjDMQK9n2W2edkhQ6k8Zmy8zBuMHHvv
         tX2iUvypffurohY5qaHf2wBYmz0VKIam23sJd6aveFYH/RsqxK/bTRhECLGpzhA5/qlb
         601gWcTwnkSODYbIaxF8RQh7KdtFmTfhB7VOg7TxsOPOH2DZeDtKJUTnPduFaU9Mn/6Z
         m8INP+ncLG75nArqe84hxJ6ynnxeVPgu9BF01c6sWZClDuEhCvp8pRWinyKWk9uJ3LIE
         6SWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v7spwhGofKd6y7Ln1ZoJ8f6gc5KiqWo5t9gBMfBIywEGG8lGA9pgtdCawhf1OLCkYHOGGmJZjTWFX+hdob6o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/tMSMjJlFrmlCUDpqDCJgAqzwm+ip8OTFP6ylgdLe904tO+NG
	KBZ7/EdxRZL7t4rQbnROH7G9lvSILFOctWx6L8Hhb5eW7EV/U6o9sO6T
X-Gm-Gg: Acq92OF9/b5OzXEP/4Pn+5M9U/NHL+Rt2C9V83KXVCwArGVPNVN8CIJ42Y7CU3bhVVS
	/LzrrWeiTdo6NQyfVwq6PTZxE7fZd0Rl98lmKZ8gGwj8ur0LuD+N3YvEKPgFEyeHhEJYYCFAodt
	TEFkYHHWFPoH4Yn46+pMdUi571LLZHL24t17z07X9lC6fbg8CuJ2eAr5RqnAYYDwY81ESuD/7/u
	Du/KJF5Apx6/Qz1vWY2puBpYAMq8lXUQn7uqXFnkwNUA8kQ0k/CcOsn9GkwH291pYEA3ikH147s
	wIBdD5zLWlG8FJGazMU0/s9cduu+1q8PBkFZw3edZ81EmGbs7U9T0M/4Y9P/p1UeXKrjKbU4caW
	2NiPhlJrLueGC/QXpiadL2+68lv2e2cADnqfFwgkPKPzMaokUipCGn/ONptlOYyTq1slkaGI4cB
	Oh+Oc4XtRFrY4sSBV6vnc0Ms2PyzpZ3K3JZeUU1gT90cYhzVguhTe2RtuspNos
X-Received: by 2002:a05:693c:20c5:20b0:307:287f:9bbc with SMTP id 5a478bee46e88-3077b7509d0mr3955694eec.25.1780925263157;
        Mon, 08 Jun 2026 06:27:43 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm20883832eec.8.2026.06.08.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:27:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jerrysteve1101@gmail.com,
	linux-input@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 7/8] dt-bindings: input: microchip,cap11xx: Add CAP1114 support
Date: Mon,  8 Jun 2026 21:27:35 +0800
Message-ID: <20260608132735.553239-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606151658.60E2C1F00893@smtp.kernel.org>
References: <20260606151658.60E2C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thank you for your contribution! Sashiko AI review found 1 potential issue(=
> s) to consider:
> - [Medium] The new `microchip,cap1114` compatible string was omitted from t=
> he `if-then` conditional block that restricts `microchip,signal-guard` and =
> `microchip,calib-sensitivity` for prior CAP11xx generations.
> --
> 
> commit 5c58a6baee363da7434a9782efa913c250015130
> Author: Jun Yan <jerrysteve1101@gmail.com>
> 
> dt-bindings: input: microchip,cap11xx: Add CAP1114 support
> 
> This commit adds device tree binding support for the CAP1114 capacitive
> touch sensor. It updates the compatible string list, maximum LED channel
> counts, and keycode entries.
> 
> > diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.ya=
> ml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > index e307628350c24..08233386a4336 100644
> > --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> > +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> [ ... ]
> > @@ -26,6 +27,7 @@ properties:
> >    compatible:
> >      enum:
> >        - microchip,cap1106
> > +      - microchip,cap1114
> >        - microchip,cap1126
> >        - microchip,cap1188
> >        - microchip,cap1203
> 
> [Severity: Medium]
> Since microchip,cap1114 is being added here, could this validation
> regression be avoided by also appending it to the if-then conditional
> block further down the schema that restricts microchip,signal-guard and
> microchip,calib-sensitivity?
> 
	
Good catch. CAP1114 doesn't support these features, so I'll add it to the if-then block in v2.

>
> Documentation/devicetree/bindings/input/microchip,cap11xx.yaml:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - microchip,cap1106
>               - microchip,cap1126
>               - microchip,cap1188
>               - microchip,cap1203
>               - microchip,cap1206
>     then:
>       properties:
>         microchip,signal-guard: false
>         microchip,calib-sensitivity: false
> 
> Since the maxItems for these properties remains at 8 (and CAP1114 has 14
> channels), it appears CAP1114 does not support them either. Omitting the
> new compatible string from this block allows device trees with these
> unsupported properties to pass schema validation.
> 
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606150458.2506=
> 06-1-jerrysteve1101@gmail.com?part=3D7

