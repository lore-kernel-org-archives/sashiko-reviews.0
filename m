Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1AA48C41F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145701; cv=pass; b=bMoXduyhuvdjrPSEBu9IoN8oUn84etKjZFKAlI0TUh56VdCPBoCyDfBQwwBtR5ENJZkeaVW7yf7PONVlJeMutrTDNX1E3K2sgGnC25iKxvPnPTicVhE3zgE9VpqJ0WKt5EFyUdlQo5OvWAfZXHdxjeEwiHCkgJdQ071gWai9umc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145701; c=relaxed/simple;
	bh=/nQ1DilIpOwATZ5PqozohClCfLj8D74is69+ZzRK1wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6Ke/g0CoY1IMPaY82U3aXwiNXZT16ll+00Z+iLcHCbAbZJngTDYSxvOCFgZcvX2nI/JELqmV/lXgcwle5A9gYdoOVBmvuzQdNYQb7d2ljS3+E2u4zvy4s4aGiz6TGQJgFsIo3KUgBZHo68Ox4QuC9uPEEOT25BDirXPDUh2ZS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0HScvWy; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0HScvWy"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160e831693so99651466b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145694; cv=none;
        d=google.com; s=arc-20260327;
        b=XnmRh7d8iROjrkIzOZg5L5eTxeICb1jgH2Hg2g2SgID5UXw5HcjX9RxaTucxNt9wYs
         OVaH6zQ9bK43TA9T/6KE7uib2WljDqEJczbJEQshefdragZ0bsk79xclVIjxN0+PGhs0
         N/ifw5ZgNwGCfJp1q+PGuSMMJYW9Lwj6hhMoAYyEY3IJM7Rh3prt/X9DuSEPaUYtgH36
         FCXoqZCILTQysivxwFLnNS/s5RmlGgsTmk6bRZee3YZC2Wrnucya5C3zeoxucdLCo2BT
         hscofQEQS3Xd5cnbd3BGeLz85zGeNntFRrsx6pEypHcaawqrfFzQk8a2uOsmCTs/ARpN
         7CHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        fh=VFAbrOvi75f333as0xskf938YGqt6n67brOCIuCz1ZQ=;
        b=SmbRWWUPxuq05/vgyV2910ytXw7H6eyeA5Bb5xfxlFR7fLsXnZZ6p/NBQZf1ngMDa9
         FEodRB0dOxv9fxI8+AZ+l7GLE9wYPMOAalZhRW7yduEty9NVdrAbYamKWnt+uLkPaelw
         O/amObvpo2bw0VZ/25H9x+N/ywT9+cZgO4JLY9jxONL16ODooSGAKqwcrZzdr28yl5Hl
         IWqNS2QsdsDatNSKtQefGEKdeJ9eEFTPmAkJEruC+4Bp02uPqIs9RXkx2023nTb9NQyf
         Im0qP46cN+87rpBHZxmtWhqnoSc8mNxB70TSg2KwNuuQ+xAgCNaNG/oajNWBmAJakkC9
         eDqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145694; x=1784750494; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        b=j0HScvWykh/y9vi6lVm/eEDpMtUyMel/ItH8EDF/L/nL/quvMA9ROw/yQak9Gb+2qw
         W60lAx1YfsoYrybrfuiT3/E0oWmXh2dZv/0cWMGk2SLcF/JsumANWVRoZQY84a4Ohfc/
         6J37oVA6Tuf2uaiW7/XewVXytVaRQ5PeIq4fFJKkI5eJGzANR5D/J/pCn74GO2ZJ+3kU
         je4kW4x2UX8oUCf7U7J0PSlZaDvCCFO8XrQ3lUmHDwyD84q9x2UpI8m4WD1V95xsp+0v
         ir5mAW/MFbOD9LhQPLBRZDU0JGUpZ+mUrpI/bwokDXWBq+Deux5prP4X7M3EL9umwPts
         +Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145694; x=1784750494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        b=MtFgOPKYpcvXYB1IgBZZFrEBcXwVI7esT0PCn7nQqQ28h2sZvZpDea0qmu7EpLyG/B
         RhhX+3k7tF70hwO9UzpvVKPPTWJ3qr/DSwUmPO8EWAyicOTwXTx+4rZGsS4qTW19VSXI
         igIqur7fUETLmanSPbURCfwdZ9aJhEtB8OKa+c0RYx/GCQqTrJimPtHKW5fPuky+jJR7
         hxlFu+QhwOxGiTCuUEyOD+iBFeDX6XWXQT0aW6uMEkq7Ir+Df5PKZDKzzjraYjrC3YLs
         JPUFX1+J1GKBf+svB2aV9arw7LlfGbBsLQj0t2KZm5fMfC0+qb5qfu3bZqFl0HRAxMXX
         NSfA==
X-Gm-Message-State: AOJu0Yxr9xDVKRmclkDmWiqExBi53vNzK2C/s0eAmvRJLooygb6xGKIy
	dv4HLfhZ03Udca9vdfItaYRbp7DjEflL17+c8nujXEGE/Er38RscbaUbVKsnIsuNTzP7v/i2RjU
	m66o9ckj4eZVwWEfnKEdMl8/jwGyoxFqPQDN+ERZPxvrxKR8=
X-Gm-Gg: AfdE7cl7KaVmav6K4hGeHcB80ZZeCHDMQ0OWo9YGbMG9ALqMn3QK0CjATUVXQDvHzU9
	F1QVZ417J7p4yVJiwK0kIo96kWfT8Uv2awQmt3E2hijHH54fq28NQUK9/Lv9vpTPMlLD1y4i7lV
	qmeB+ynylSJVvvcc+QDP6DZkElct7T4DK9rwW/OgU9KTA4f6KafxCsxbPf5ncgbJ4YEvM1Tsoo8
	m5LqG0Zf5pgoTQId7gQJUZBhh2jQcxzdJninY+QsLvczMrGO5VQVmO4XAZui/vlnx9N5xWxD5Q=
X-Received: by 2002:a17:906:514d:20b0:c15:a1e8:c141 with SMTP id
 a640c23a62f3a-c161f39d844mr780858166b.30.1784145694108; Wed, 15 Jul 2026
 13:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-5-coiaprant@gmail.com>
 <20260715191451.515E01F00A3E@smtp.kernel.org>
In-Reply-To: <20260715191451.515E01F00A3E@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:01:22 +0800
X-Gm-Features: AUfX_mz1azszxJwrCVQmAtzoyTuEVivMl9NuC_fGRw6nOWKIq7dE8EPDVXJyALg
Message-ID: <CALj3r0hFMRb4iX+=JUjAzBskgXJPU3xdwz_pmg6G+v3f3+_XAw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> [ ... ]
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3568-cru.h>
> > +    #include <dt-bindings/power/rk3568-power.h>
> > +
> > +    pcs@fda00000 {
> > +      compatible = "rockchip,rk3568-xpcs";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      reg = <0x0 0xfda00000 0x0 0x200000>;
>
> [Severity: Low]
> Does this 64-bit register format fail dt_binding_check validation?
>
> The example is extracted into a dummy root node with default
> #address-cells = <1> and #size-cells = <1>. This means the 4 cells here will
> be parsed as two items, which violates the maxItems: 1 constraint defined
> in the schema for the reg property.

I will update the example to use
the correct format that passes `dt_binding_check`. The proper way to
represent this is:

    reg = <0xfda00000 0x200000>;

or with explicit address/size cells:

    reg = <0x0 0xfda00000 0x0 0x200000>;

I will adjust the example to match what `dt_binding_check` expects.


> [Severity: Low]
> Will this fail to compile during dt_binding_check?
>
> The example uses the PHY_TYPE_SGMII macro, but the required
> <dt-bindings/phy/phy.h> header isn't included in the example.

Yes, you are correct. I will add the missing include:

    #include <dt-bindings/phy/phy.h>

to the example section.

Thanks for the review. I'll address both issues in v2.
