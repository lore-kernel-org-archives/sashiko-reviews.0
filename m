Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E3422E36
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170388; cv=pass; b=pPltw3cWmDomkErtnYCmMF50p7s7cem2A0q4qHG/ljKV5LUZmGqZEAyW9yDEe0H66gHuZUZ+SsB79erqboW2dpi9+zgGgynQEY3UlBST2wQp/L2KSz/elGqD5jOaIs1LGqZ53K8EABWHo7Sn/llYc+trF628VlN1CLGd8lqvgD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170388; c=relaxed/simple;
	bh=LUBbrdfwesGlRHcWDHljUgGTGcVHOswwt3y/veuVbZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5mVvIb+2cZyuWcNvcgT9vl7TPO7CeIH2LUNJX2KZ+Mwk7qFz7XHNRxwOrCoviPVSEsnyZDdcRdMtLQFZRydD0eb++PRUZIRJlK6H9t6OSf4X3wlXdQEnfxa1pKR/t5QFuDXoFPtlyZWxraX2T//8yPXTjDScYcFyKzVLLfmZ3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G163/HsE; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G163/HsE"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c10e86e52so440161cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 09:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785170386; cv=none;
        d=google.com; s=arc-20260327;
        b=dKTvtkbRNoqzFPBDjn1bziu0C7bmcjwX5aQkI8SACHpf2L9oXbEW3U3cNRs9ROEU5q
         wn/1x0M5bNRzexk0ZSseB9DLpEbbHOA7mjBAQMB46EM82JE2GnWRKg0424z29bVWwPBz
         erLI3BBOMk7rmuXY3RwVdEj85Sz7oy38mJ5968Lc/Ghrif/Ar2TRJ2HV2Wmg8kVQbG5G
         3Q0zPebb9iZLz9QyYZhB9J7yYiX8MD4cvCJmsV1w+ZEGDCAyFPbTSX/nfU4r6+Geukul
         nwkLypIM1kEX8h8oOQLLcGoLib724Rw9OP5+/R+ANAuOMsEaD3yTS9DW7DXPpie3FLnz
         7PTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LUBbrdfwesGlRHcWDHljUgGTGcVHOswwt3y/veuVbZY=;
        fh=pR1PadEp2KmHKeyis02pFp70UcNKf0Im+V8qeihPRrY=;
        b=A5HFv8PsXo8EUqE+HT/m58ycgmaxRM7fzVRBxCjEASTZwtG1j+WRyNiEuZZEz5BErO
         SjdWPdbmDcIyLgnZnlYJe2NIE1HYZZ4jfVnLBKtHSeOlpn6yfcXNJpl9HNVPcwCuYy7H
         ApOYuXu4V8armaCVwn0F0Ho+bxNGzlfgbfZ8BsdAN3WgQuhqCnYnI3aiH8Pt5vz4OvFq
         BmrClcesX7pK+ZfXD5Ot/Zr8RtNMVBMrxmJb/eZg2HJDONGMBfg+KPhO7w/vBs6zDbeS
         4UGCczR/saQrUbrWwa1tAUOlyk8sS9oNHHXzo4S23iC8Ht9vKAv/t+OcOAbi72kV/KGT
         fhQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785170386; x=1785775186; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUBbrdfwesGlRHcWDHljUgGTGcVHOswwt3y/veuVbZY=;
        b=G163/HsENEP4OvfHxYEy69ObmsYFuu84l3NHZeYsKNSJwfrNMCnIY5PWYQjlXQe9DZ
         CvSeuEryvbS3EB5kjo0b4Uflll1mHfa1dB6zpBzU0KB87NYNFm/HrYE4ikQOIztSt15P
         BCbRS7r/LUxPKK+Vc1QqWM7BUW+LYmWVQlESkKtMK786hXfYDEVlGn93X8HIitAfkSR6
         xlpqVvr1HOU1GXzOP7dJ6zjBNaHsI/AaJxKxNxz4gFHPlwq4kl0PZJQmKeCu4vMV+bxB
         feewMbDgBN5t6CFfe7aW+N080wxZ4WoJ6C96+Vx0iJSqfu1AeHXntG6V/rsmCi4VNGB7
         1G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170386; x=1785775186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LUBbrdfwesGlRHcWDHljUgGTGcVHOswwt3y/veuVbZY=;
        b=RobM3fERrS58wBAwmRsKcvG8FpmwzyKIQWM9OZ4HfZA0/7h+lmtV3x9uN6xQa9Simu
         RAbWThGHqi/923sJMnepVi7yFBWpX22qcR+JrkiV/r9UcVodr/c2NJIZ1Tgz5VfsgCIc
         XpcMlqtei84mw8KiWhh4XhE/tM63ewjg5LVDLDxRhzDhzIzMzEsJMWpeZ/DBTa5VKlFW
         Skufu794xNa/LG6IBJ5W4YDMf5j8ho/xKo78p+02vvVbWUmXErQq2bD+O5MwNkE2JQiD
         mJ0ZYIX10yxvjOOLHzPrSumH+e1b1q/qhxoo9YmWH/VF9D5jYsUU97x93i852VOsjDKF
         psDw==
X-Gm-Message-State: AOJu0YwvHGdlN5z/S17Z4KTTUCDwhqAaA/i5JStGFSMf5QCxsQnQ9MYI
	wepMeUWyXr0pFOFT/bd8/dUPsmxC2UHwJZB4VWmYhLrexG7NWDU7wPYtoFEDwYqpEBFo9iASKH9
	VGZbuqYzbpq5D7XO9a9aBRTtIwjj7gRIHtTmRpd7lrWwcPqTQkwrhbadZ070=
X-Gm-Gg: AR+sD10b/PMB+ej0JmYNjmqv8o+kXG11AlF6qIKqD9i9pt+k52PWx8VwhzHswTCPDYU
	1l0ja+FrBeMGbdZvpbIq2an6CRJJGJMg/DUlYi/toMdXZYGrGh/B2YhhFQ5EE425X/ZT7UXx18P
	ywm3CW/E8WGMRPAoVtuCy+sPBh7uE20IE8w1kqC+pa0Dn6QtMXtXlf+DVSFeJTpz5qCOX2Dut7q
	ozLUXXGtWyyQfpoXZZ8x8q+TIe1lqNmn+gD/AEsCvJYqf5ZWYoA+wZEUNXqtm0f38QBmYV8
X-Received: by 2002:a05:622a:901c:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-529a76e10b3mr34531831cf.11.1785170385186; Mon, 27 Jul 2026
 09:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724104819.1296803-1-sascha.bischoff@arm.com>
 <20260724104819.1296803-11-sascha.bischoff@arm.com> <20260724112240.4FD981F000E9@smtp.kernel.org>
In-Reply-To: <20260724112240.4FD981F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 27 Jul 2026 17:39:08 +0100
X-Gm-Features: AUfX_mzw5Yr2AUqO8uAEYXPzPNlrBJYH8jNQa3p7XPPYeAO9kSA3O-KglVf42h8
Message-ID: <CA+EHjTz0byw1LJDnqJGsPgOYz-pwyyY_u5S_44CbKGAfKnQkgQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/48] KVM: arm64: gic-v5: Introduce guest IST alloc
 and management
To: sashiko-reviews@lists.linux.dev
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 12:29, <sashiko-bot@kernel.org> wrote:
...
> - [High] Missing `GICV5_VMTEL2E_IST_VALID` bit leaves IST configurations invalid.

Replying to this one because I was reading about this today, and
thought it was tricky. This is a false positive (will teach
Sashiko/review-prompts about the GICv5 once this series goes in).

I do not think this one holds, and I would not apply it.

The IRS writes that bit itself. `vgic_v5_vmte_assign_ist()` populates
the IST section and then issues `SPI_VIST_MAKE_VALID` /
`LPI_VIST_MAKE_VALID`, which is the `IRS_VMAP_VISTR` write, and the
IRS sets the section's valid bit in response to it (from the spec).
Software setting that bit itself in an L2 entry belonging to a valid
VM is UNPREDICTABLE.

KVM makes the VM valid before it ever assigns an IST, in
`vgic_v5_init()`, so it is always on that path. There is a separate
case where software does write the bit, when the L2 entry is populated
before the VM becomes valid, but that is not the sequence here.

Same reasoning applies to the level 1 VM table entry, where the IRS
sets `L1_VMTE.VALID` in response to `IRS_VMAP_L2_VMTR`.

Cheers,
/fuad
