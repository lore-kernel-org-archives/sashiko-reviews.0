Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622013;
	b=Xm22xd90L/aZOvIXt/h8uwtAjHLaEiLB+D8ikU458GQwdTSZSvEmp4JWxAHxeBxNw75x
	 6bzYN+oMlyzaUTp2XXGYyBF9rTQ/PYtmvba3H51riuW3Ja9WtJWEuJCN3a/PzUbwdXZ70
	 AzVyDIyul4ABc30lhXu3EmrDgMoPl09SiG0fHaOy9eczP+A/X8UdTgZZc9vcjDZMYgx92
	 TVHPYZ5Y7wxhXTVSb7RceZZApV8y5eKBqqBGZ7hID95A3PFld8WPw5w1FvYufB64cX3I5
	 ZR7VVWK5df+udYg+hdb3381Gk0U1G0pYG05308UWwVq5czjauP75JLuNm3osSNNu7gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622013;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=604SFvy4+RgSkLOg62spOBToZb/ngKE9hV/JFGFCqjU=;
	b=YKWWzlV5w0Y/iOdLT4drl0EHAxeNaJgC++UwqFxg9jQhWb6ILItRiSkjqoFOAyDBFSL6
	 oJC1b9tPdYZi0LPtMgAmxCbc3VrNvzLp8CRRgKseviZ1JJxuNsFeNe5tRFPWPCJIKZY/p
	 WXmZupwUC/w7G7teAF3TfsAiZCA0zufP3jq6QU9RPhtMbFAIzOQMC1Z5YOW7SQmjAmXF3
	 gM6hCpbnmJsgVj+Y7MphTUaLC/5jFRgvOieThqM7L9P61/sm2VwGfXySHAlQhn2Y37T/l
	 fvuLO+LazVn7gIFXBh5juKSjQZJeYRoW4QTW+0UyZl9OeXohQJiKVQkv2TLyxGrfh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QvhOu6Ym;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51175606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 15:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51175606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QvhOu6Ym
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zzi6AwEaVyS7KWiqQ9UFdMnPQT3SvBIYY8OV76VYzEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795622010; v=1; x=1796226810;
 b=QvhOu6Ym4A+j7dkVWbIShIGB9vv9ovAl9tIZykwrx+hdesdTnRIyQqOh9E5EMr5V38R/eaee
 8oDIpQrTYeBstkODTVgMrAxHznCm93luADxXdKGpXi7cnG1gUuVaXtVoRXACQNuwnU882apP7Vp
 PmCgsjGlPRRW3fjo7uj+KrKI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 758f7d991fe6f229;
	Wed, 25 Nov 2026 15:53:30 +0000
X-Mizu-Trace-ID: 758f7d991fe6f229
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so37148e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 07:53:26 -0800 (PST)
X-Gm-Message-State: APuU4Z8L/B1ogP1C9f7Rn1giuKoUqu/MzPWp6HmJMmXxqeGnH4D+9ynB
	1eTuu0WGL11ITlod6KzKmRXIBO28iQuqNCOEgLM4gIKEC6YNHIDY78ZELz76aSDJuw7WNlLDmBi
	sAnWTBjyzOfa3i0sRBZeLbiVHHFlR2XcEGpzkn55q
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c212394558mr542334e87.3.1795622005333; Wed, 25 Nov 2026
 07:53:25 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125153911.106793-1-fuad.tabba@linux.dev> <20261125153911.106793-3-fuad.tabba@linux.dev>
 <sashiko-outbox-233677@kernel.org>
In-Reply-To: <sashiko-outbox-233677@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 15:52:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxB4VBRFrwS5LVo2TrmwxLG8=Oyf9JTBWeCaXDfp7X_NA@mail.gmail.com>
X-Gm-Features: Aa3M54p_f3WBy9239pNU7mXjKEDGd8rPn5mPXG1-qpZx9rKsY0g4RHXqEgP4sNA
Message-ID: <CA+EHjTxB4VBRFrwS5LVo2TrmwxLG8=Oyf9JTBWeCaXDfp7X_NA@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] KVM: arm64: Don't advertise the host's MTE_frac
 to protected VMs
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 at 15:49, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] KVM: arm64: missing Fixes trailer for commit 3d7ff00700d1
[...]
> [Severity: Low]
> Should this include a Fixes tag for the commit that added the MTE_frac
> entry to pvmid_aa64pfr1[]?
>
>   Fixes: 3d7ff00700d1 ("KVM: arm64: Rework specifying restricted features for protected VMs")

No. A protected VM doesn't have MTE, so the field isn't read, and the
wrong value doesn't cause a failure. The commit that added the entry
is in the commit message.

/fuad
