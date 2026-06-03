Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976CF31985D
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780517706; cv=none; b=N20UuwlVBDe1whQzkzdzL0NqiezgyWiAytzIc+8nJPKQsnOHLcR7yUOF1oRx4hhAIGMNeM1W5lzDkFPcliwfG6oAVp1niE4s9BTkEG5o6aL7XoI0aCG4jTJVkFel9n3pOd+RHtIL7qA5pE8SiHF1pGmkk25K2a3YkgzFe5Kl950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780517706; c=relaxed/simple;
	bh=sO1nneZ4T7xV8Woi5b1grLQBOHrxGNQXxrPZI2WzrAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Il16MAIwJK+KXdqjvY75GJgiwZJFY7rBlMboy1eJg4mxRYjPHTninJQtQQ1kTRPDbsKGhsDkFNbkvB6GY2LR5xNEtSl54eBiHvfKcI2UImsi2mrU6lAGih+Vz8iDI0XtLdWUQs9PKjY4AMJ34Hixq8ZUfZR7lnv7XiFWxddQ5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lek/ybiH; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lek/ybiH"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43cce7db292so3224194fac.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780517704; x=1781122504; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K/dIMvjAW3Fjg5zbaaxJs4cecWXi6epOwVSNNUQhQXU=;
        b=lek/ybiHifd7luGGiwxl8GcMpFQTYBja27V66OBSNKyR3D1atZScDkdStO1I7x9eMm
         N58fvjMp0Y3tPvoTIx2XvHcaUMTecstmavV5fJziaF/gvGeea2vtsNTMC0U6d83BjHax
         Cw1I1cLizRNq93by/uOwx6UBc+MZ+saUynqL4bfsxaNRWRe1zx+t0idPUqLNc8jMfia6
         1YfpVxcppUJyP73rqVbAGxI4QsxD0y+mZCMDrxKubQByGOQ610YiQWOxpRdb4DGr5clp
         VHuI+n+E6re/83Whd3YJiZZA0QgTUJmSOk+sSH4Z44vaOfQ3QVfg2h3geT/aLgl/WMmg
         ld6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780517704; x=1781122504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/dIMvjAW3Fjg5zbaaxJs4cecWXi6epOwVSNNUQhQXU=;
        b=VVm2kyMUVX510cUwIFm5ZMdGCZ92hjbfIpEikfo1Nhqadu89qrn4vBdukhUj3eWoaV
         iCYpYpB47bmiLf35qJESkw0v0fUUjasw2yx5ahLrDvVCyiXfsaAmPm+pnXAi4Vyp0km+
         a38VZbZ/Fwa6/otbZmzcHgQ9cpfz/68lmarRN0KC1Hr0MZBNyYiuV0fFOLtE002Di2th
         zWYekjwcupXn/0NAsVGmTm50Hx30JtwRBbgCOqP6nrQ4fwKOSbAu5+e/4gG9Gxhe/4vk
         LuRb0BVCeF0ePVeYaY55dssnKVPj4m9g1VjRAM4WLCzcz+bTWLUhhRgH9rlDDbOIA97W
         r4Cw==
X-Gm-Message-State: AOJu0YwKLzu2ouk5dZ/axImBaAnXhHBz8B6FNBsD73tt4bIHzmwLfad2
	1115CHKL8b5KSynTD5J3t8jd0Z681MSWg+nGWwVHrPZdMx+tbDtgFGMRA3ru7EEV
X-Gm-Gg: Acq92OF1FTFGv/meRXtYcG+c6rGDUm8GUOhVW+g3iq290zFnOD+biFknQG8iSpfJaXo
	rQ4yOFTG2WoB0Sj8/yi6vOCaH3+bUUPkNm81vUPMiyDU7zjzNaf7vawbpk+QIFarxG+NcYFrzMp
	DE520aA/0DOOeUf/HnOYrIIBhkjN4rNv8U0aFXHo6SNeA4OAhxBsU89eIgq3ajNEKieuNnxC5q+
	6YnC6qIae1h6T/2JPjbOWfnCjeWnIPbYMPF9020/MuXyhJz+BLW5frJRTzNSYuqHYoSBUy7MhqC
	PBpOlVogfVUgfShIbkgL/ac4Oabted892OVfqBGD6u6T/hzsOiMIGMBCSAkyGNtWfFYNwv5Deta
	rat7hCo7h2keC6r/7Ouvh6NAHpie83V80dCSuNHESvUbIe5bzarsljqODRDHIRu4zD62wqqJO1Y
	iDAcgsnt4ckwLEHJgs6Kkatb/STYCATQNdHWP+lXc=
X-Received: by 2002:a05:6808:d48:b0:479:fc87:27ee with SMTP id 5614622812f47-4865aa4f1b8mr2895892b6e.1.1780517704461;
        Wed, 03 Jun 2026 13:15:04 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8500f0esm3003888fac.18.2026.06.03.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:15:03 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:15:00 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: input: remove obsolete matrix-keymap.txt
Message-ID: <aiCKBXqvOmQ8gC_t@gmail.com>
References: <20260529052246.4934-5-akash.sukhavasi@gmail.com>
 <20260530052311.271791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260530052311.271791F00893@smtp.kernel.org>

On Sat, May 30, 2026 at 05:23:10AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The commit message inaccurately claims that 'Eight files still reference matrix-keymap.txt', when only 6 files actually do.
 
> This commit removes the obsolete matrix-keymap.txt stub and updates all
> remaining references across the input and mfd binding documentation to
> point directly to the matrix-keymap.yaml schema.
> 
> > Eight files still reference matrix-keymap.txt, forcing readers
> > through an extra hop to reach the .yaml. The stub has not been
> > touched since June 2020. Update all references across input and mfd
> > binding documentation to point directly to matrix-keymap.yaml and
> > remove the stub.
> 
> [Severity: Low]
> This isn't a bug, but the commit message states that eight files still
> reference the text file. Looking at the patch, there are eight total
> references updated, but they are spread across only six files since
> tc3589x.txt contains three of those references.

Yup, my bad. I counted eight and wrote that, should've said eight
references across six files. Sending v2.

> Sashiko AI review · https://sashiko.dev/#/patchset/20260529052246.4934-1-akash.sukhavasi@gmail.com?part=4

-- 
Thanks,
Akash
