Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A7175D53
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098246; cv=none; b=cp023SZMu1mTp0TrrOwevltiLj2dUzPBhQmhR4z91wfMV57aqOtMU1VTLZA489Y9mHTrrG4XmNs7QqneEnOssN+XeuAPyEwt+VHGGe8K5B9CHthfAqXs06kagEGY33ezuzsf7ozxp7cAsSFXEOZtwJFebmiUWuNDULYoUODJ+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098246; c=relaxed/simple;
	bh=xfVxg6gl5w+u7tV6leMRJg88uDbrZR+IfArPfW8E5/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZBMeXWboadjDZCvkL+YuDtGZ2p77CXMrWbkomK7gnnhNa7G4WlnjuHUBDpDfh7Rol8Af7MSBpRMFax7YVnMMtCNGYP+nBFIBK+RsZXovp3oHszwiLEhxxAPq1CFh68p3efG7xRL3xFiJgNQaGjF4xLoyTb9HkdHdY3OB8z6KrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh4VBxvs; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh4VBxvs"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9ecd7216cso320799a34.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098244; x=1783703044; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dmaz70Zg8+nbLWCKBtz/pZ0mkbLi/T/8RKd4bWX5wQs=;
        b=Lh4VBxvs+J8bD7SAH9Fnxab/KoueKq+KhNvoztwp9HIGM4LhIAEgttlnKs7djUx/Zk
         EVrFtJJdEjGNeJGM2i1GAMW/vyY6f8GDXMQD0plL3P/OshxEETK0JmWkXgv3QwCdELUi
         XiNxFJS9B1HHSnkaXM94XUJ2CtiSlXjaS0V7tDCSJUiiecmQVcJYyGLE0CAAyEtNEZnI
         3sFdgmpCTQw93LGtI3mogz8KV3IvOoSE+MmtCwYHH1shfOsqSwdmPBxPBD7GWN8QmxxH
         mxIFu9c8JEpa+n2oe8vLEiTGZTSdGHTchFcYB/XLA5RJQgB0aPB4baREfa2avYEM4Sqr
         T4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098244; x=1783703044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dmaz70Zg8+nbLWCKBtz/pZ0mkbLi/T/8RKd4bWX5wQs=;
        b=qT38TZ+27Ly0Z5BQFxz1pf537tzYIkTuER3mxvJSC2J33LuJ419llEibUf+5sU4sNV
         JnF8T7yaF4f51VUVmpVOpyontQZX5IkKwhjarew+mgNlYsH4mrvy7eoIdv8ly9uwCRPD
         CrPvfPnVFJ9o77qod+J1z6cxem1O2HptO4AMMpUzkh1TOcXoSjnWQ3TsjSQ+Urc3CBs3
         dohkpmfvqJScxK15pogidVyDyQ6XGdBk5gAu0kOBhWPdaoVtQ/8ptKNdZteXcMOn+T98
         cEqvwWmRqJeq5qKcQcZOQqrUwcF652iwRc6x3enYzrXQDQWxVDtztihKXIyTPVkM4bcV
         smnA==
X-Gm-Message-State: AOJu0YwjMPRHfgunuiMo/RmZ6vDCRM9+lT/X4x5Dx9jme83WBuyhwKie
	iXX2vk+7grN75paH/LzGq1dTo5+1FdKxx+NucDkmlexwq823rMjk8Siw9vR+kw==
X-Gm-Gg: AfdE7cnnfA/yUc8v+Hk8s8lB+W7hnIU9H/bcHLHXx8NiJe1NY5356yZyBWc0pJ5JRek
	dP8Lhi3qdhh7j8Vs7DX6OwHGeiY/u5c04bKbylBR/q8UPvElBAUZDMPglzj7nkB4gPdDlP8b3tD
	8IjwujM2LHDsPo7/j18shS5McybTggW9HaR45gCxwxDRzUOhJfIkiJFgcEKpt5ONNoNV7j0c4dl
	Rf7CkCbK5EEdpPvRYmupoMgfWYJmICb5DD6gPbRyZyWbaKZSpIfNwjxiI9nd1iuqWGg1TjBspvZ
	+EAaOQYM0f1lZvEd4jqOnlmApyjAPMPUh6GjlWQEocu7uITIYbJgXRPyya8VvOrSC3wYvKK/1Gu
	cm17caLVK/rv4zf7D8P57hJzR7aolJTAWqLETuULTemtqgpqc4weUereze0bnK/Djf4/ft9AG6X
	SfiyrOMKc1O/silP4xGw9IAg==
X-Received: by 2002:a05:6830:838d:b0:7eb:3af8:8c1a with SMTP id 46e09a7af769-7eb7fda9ef3mr199373a34.9.1783098243743;
        Fri, 03 Jul 2026 10:04:03 -0700 (PDT)
Received: from localhost ([2804:30c:1618:8400:e838:86ad:21d4:de00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb54534789sm5378744a34.26.2026.07.03.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:04:02 -0700 (PDT)
Date: Fri, 3 Jul 2026 14:04:51 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 1/4] dt-bindings: iio: adc: Add ltc2378
Message-ID: <akfrs7OtamEIoVxE@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783028033.git.marcelo.schmitt@analog.com>
 <fa15b8fe33541fa2e8c7a3f124b2482872fdcf26.1783028033.git.marcelo.schmitt@analog.com>
 <20260702215235.517FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702215235.517FC1F000E9@smtp.kernel.org>

On 07/02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Compatible strings with required fallbacks are incorrectly allowed as standalone strings.
> --
> 
> commit fff47614872c95c6a481f63da8b14dfcedd0bb53
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> dt-bindings: iio: adc: Add ltc2378
> 
> Document how to describe LTC2378-20 and similar ADCs in device tree.
> 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> [ ... ]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      # Single compatible string match.
> > +      - enum:
> > +          - adi,ltc2338-18
> > +          - adi,ltc2364-16
> > +          - adi,ltc2364-18
> > +          - adi,ltc2367-16
> > +          - adi,ltc2367-18
> > +          - adi,ltc2368-16
> > +          - adi,ltc2368-18
> > +          - adi,ltc2369-18
> > +          - adi,ltc2370-16
> 
> [Severity: Low]
> Does this standalone enum allow devices that should require a fallback
> to pass schema validation with only a single compatible string?
> 
> Because parts like "adi,ltc2370-16" and "adi,ltc2367-16" are listed here in
> the single enum match, a device tree node specifying only
> compatible = "adi,ltc2370-16" will satisfy this block and successfully pass
> schema validation.
> 
> This seems to bypass the fallback requirements defined below in the items
> blocks:
> 
> [ ... ]
> > +      # Low sample rate fallback for 16-bit unipolar sensors.
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2370-16 # 2 MSPS
> > +              - adi,ltc2368-16 # 1 MSPS
> > +              - adi,ltc2367-16 # 500 kSPS
> > +          - const: adi,ltc2364-16 # fallback (250 kSPS)
> 
> Should the parts that require a fallback be removed from the single
> compatible string enum so the schema correctly enforces the fallback?

Why? Should users be prevented to specify a single specific compatible string?

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783028033.git.marcelo.schmitt@analog.com?part=1
