Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDF3358C4
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717517; cv=none; b=CwcqlnpPno6vUo8Ye+GFcAshkm1omQoXBL/f20TWUXsJAKyjf3AGPLPAtha/i1f5Nqd9Mo0oLT4m3GFZ4pV9q9z5Jav8U1mZI1YkiZBKoqa8dJRyigtcGM+Y1H3LvpYwewTMpor5XsC6wA4/zuh7HuglWUphsBxP3lVfb6EWuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717517; c=relaxed/simple;
	bh=Y9rY2Jlt8TiJA0r8ECXZFgh0+xgm/s59QnNRstAJBNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAyTT5nqEzrZS9mgiCqY66WU2MDr17B3YamEGiOyg2iTh7y1S/1Y40F3l8wQFHb73+JjW/Ip3BTiRJSMIoeNMZ7vC4sV+ae3D1fgnPoJByBDIxOPLYkd2MKx8b1j52IpLm4Segw/+00C5dSdVS5pUY8Q7VFQK/c2b4jSYS8ydBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpKNO5sN; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpKNO5sN"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7dbcb505578so15526037b3.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783717515; x=1784322315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0UXVSR/LU6AV+D3rGjC+/aVuDb79zOp9N6li87nFI8=;
        b=TpKNO5sNJekYP7Y/N5br28HfIbekJF/t9qP5mukZ48SO0BN4sXWWEqb5jMRdNLHVr0
         p3S5u/ThYtIHSMLImiaeYx/nM3ggwUM3to7WDJ9AN2sCYLvTsQNfBK+57J37KtxedLPV
         p//cNVfzBRh771jthIDQx991SvOipv0kILag9hbL6PVZmVtMeFQ2oU7cbBw6SPDHlZtz
         mtMSXb6Fc2sgvNUE0VfP29hlBLc+tzPILI+oKQ5NhJ3xQsPIm7C+j0MBx78HzsV9GBYL
         BcqTJVLOrrmTiKVF0gu+lfhd8a+QiDjT+aVX/hxUkFrZL8eqT1Q5+5Tte5yDqK8L/Yxx
         5nWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717515; x=1784322315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0UXVSR/LU6AV+D3rGjC+/aVuDb79zOp9N6li87nFI8=;
        b=qPTH97fVKh6vCPYohl59yI1raJ5Jz4BxoKw/hUI8CqkkG8xBNgjp6BxDsvGV+4HySF
         RE4yChn98DcJYVEKcI+WVBbG/zluBS3edz1bYjHQtISFYAceQsjnqIJXOK/a8ab8FIdD
         xq5QaTcwBvrsw6UmPjoSGxzBxm+kZG8wntF5Y5xqh7RcZYH8VCD4HkkjxMYo0mw4EShV
         CIiUvVyZ62+Ej5RG5z3eqAcHO5QZrb5idjxxRbo4i9FE5jfhFNk17ct6Upz7BckjDpdE
         nJFtkEEzmQcZ0IuGyHMc04vBdkJRPmMQREmLEkj03TzPne+BUPl27j3jjP5P+KjFOD2O
         4dIQ==
X-Gm-Message-State: AOJu0Yw2lVNS4OjSL4DtmBbwkMd3zvxKYY3zjzOZ1tol9e0403+BHs9G
	diNvZSd2CfS7d3rS7BwvvrdP2hjppQb1NZjEgOF6g4FZGB+JiGqzGT3fZLBDtQ==
X-Gm-Gg: AfdE7clt1yHqzQTsnxKI1jYjujahUUSen7iHazEMgkiwUotY+ERm5L+4esTfRadpA44
	N8/hAP2HQfugiaRFUufZvkvt1+lEkb79anYKSH1AJeRJtOQ3CJfE9YfNaiU+W+8BPFBuxY6e4Z3
	Wmu0Ny8h0CAaTBLQN8IL6QDdOUioSj/6e59YxeWsBvm2DPikDH5rO83QX9nfPmdOkL9a+lnEqAE
	PjsIoLz1uikVd2bxDMlCASmvJQ/7+FR09lIdiQQYaRjMSa7a9lSN7fykO7jO2srOVCP13iuqdr5
	V9y7DV+f9hwg0TkqPOWiW3+qm9hLpZI3JERCOBkbjWl8WEpgh4mO8HoLAj7X7UUP9+VXmPVcpM0
	mCw/PU7lOh3P7fdJXCQ1vmZ/BKMT8zyCj0HwCg2FDcoZwCt1ao9gdtzDFVjGV1rXEbIUEWJp+fO
	pILI1ElQXXPR/xp+ZgUCzpkQ==
X-Received: by 2002:a05:690c:6e88:b0:81e:3eba:b10 with SMTP id 00721157ae682-81e90139b71mr4451707b3.43.1783717510313;
        Fri, 10 Jul 2026 14:05:10 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf58f85sm56549997b3.18.2026.07.10.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:09 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:06:04 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: Add ltc2378
Message-ID: <alFevGBn9N-9tUZK@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <1a3259037ac87539490c8e070487703614e41e62.1783629101.git.marcelo.schmitt@analog.com>
 <20260709205853.20F921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709205853.20F921F000E9@smtp.kernel.org>

On 07/09, sashiko-bot@kernel.org wrote:
> > +allOf:
> > +  # Except for LTC2338, all designs require a voltage reference input
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - adi,ltc2338-18
> > +    then:
> > +      required:
> > +        - ref-supply
> > +      properties:
> > +        refin-supply: false
> > +    else:
> > +      properties:
> > +        ref-supply: false
> 
> [Severity: Medium]
> Could these constraints cause a validation regression for valid hardware
> configurations?
> 
> For example, if the LTC2378 uses an internal reference without an external
LTC2378 doesn't have internal reference and requires an external one.

> supply, forcing ref-supply to be mandatory (while forbidding refin-supply)
> might cause valid device trees to fail validation unless a dummy regulator is
> instantiated.
> 
> Similarly, does the LTC2338-18 support overdriving the internal reference
> buffer? If so, forbidding ref-supply for adi,ltc2338-18 could prevent accurate
> hardware descriptions when an external reference is applied.
LTC2338-18 has no 'ref' pin. LTC2338-18 external reference supply is provided
through refin pin.
