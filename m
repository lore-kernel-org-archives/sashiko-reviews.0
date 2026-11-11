Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794372240;
	b=BzFsre6wvMcwgxkEbMRZZV3L1B1C2AQ70MFkFU3d3KW69P/GDx8Ye9IlHUHsJuXXxUJK
	 xt0RDSUo6sSPZP7BTlUlt788t9yMnDuHJ47nrCa4SOG9pGCNd44fu1VjQmM+l2tAYF7Mr
	 7lx3c5Q+89czuiqYUAX+jSwk4sdvPXWVwU7mxLuhf+kR09C+J0BJ3H1Kt3EDhbCNvOU7f
	 ONY4DmsLIYhrLTEZv/kLz9VLzfcMCBy3KnQOPJnHlzcQk2lISlH7cbdQSrfqa2Bd6qMdv
	 Cn44xlKFQAZB+beaM0O0lb7G/NZofo1IdlwURGJNbH24R4M061aj6gf16UCm3MNppqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
	b=J0de88IKIdrcfVbcxoPMTh/t0Npdw7v5aKh2tvAijfHc7tycjfI+UzU+jVY+OcCOTu9S
	 RFv80XJf666HAyHSRsIv/pq/2QM559LIM+oOVDa3BR+W0kQ4n5GQseVbfCZUBFdG73SkS
	 oyvg8t42wLOH2GCCxb3PDjc3srP5bAOkKoffP29tijhWGIMxTuHsCbFdC+SIJNsZLGvjP
	 xYEWbwl/emm2qlPR9y3dIYq649jVgu3C8RyXXcSQDxbhAhgcxEm/qS+rKhNIhaV21xjaT
	 qo3BL4pqXuoWUt7Zbq4ad+cTAymYs2GwlO5WoAFWydP4gCH+WQ/h7zXSaTPZQSI0v5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUsOuEzy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC52606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 04:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUsOuEzy
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2eb18f4da15so11151895ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 20:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794372239; cv=none;
        d=google.com; s=arc-20260327;
        b=HHVayNpAS8XxZtMYcl8UZOjUNprbJ3De7BJW3r/01XunPq9F6GKDuEtHCE0QtO4lFN
         pEasqn+xcUNpHsAvgin9vcN0UG+qifPjsInDQHL/LTj2vWrJJ3IyuY2OhIqjr0cbum2A
         TLlnHP1Qz294JwZPs3cG/Eh7ddhnuCg9kOxU8gCyZIVnHFpfRDi3qTIU/Z/QEOAPxsk+
         pti+ouliyh6fZTd9yNy9kVkjZWuoUWClvbQZedclFGwBqtCYQl11teixDqx8tKre5Qh0
         PU6bRoG9uGYY8SYQin+R2VC5aKmN3J3VnyZ8bTCa/WLMqT5UOVTphc0Jn3HB4ZikZCQp
         0xZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=cDq14Tb9Xjl0UFL7WjxqWjGEFWMzFSPPjz6FKOUehZeU1yVot+SEiH1MEcAUWysFK/
         8Jg6gtZNLJLNDWURaUAZSKS/tK8Bfe2H300Wl02gfuInpfC7m7IRDimq93xs0fgfYm1F
         z+Nq9qI3HC1qWV9swus9J1zdDAHOj9vvn0aUPgIA4ieU3Wiv1m9WgOVfGlrHX72qF5PA
         68tptysTm97GfkeoGgKI2kcGnw5H4MqKIRhA65btIewRpnRhSLnmAsxfiokNF5P2+JK2
         buReoRdoeHLVm+/pfHlzch0wOtVJqmQBvoGVk4mTCHucfDAzmvcCSMwjZwR/9MVT6Cxp
         vrLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372239; x=1794977039; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        b=GUsOuEzyKMpPBiQD4T//eMB+/6VmZ2jum6pbQLhCfkaej5P7x/ocjS95+9UCS9acfZ
         Ge9VLhWLVNH6Wb/4Asm6oSYQrOjeU+BO33K0ELdHuVnR6wqYmsGRayMtmxkbOEqwbeVs
         KnksD83dODvelcx2oCUZohD9v3GG3OIezFKbErhQDdNtnNFOGsGUezmrzKPBdAGzZKCN
         5SDWvMis2AB0ctxKi9wmG5sExkeVVQLzQRM7tGG1JvWYVd3AhP4MLZcki70jHF45nf5I
         jrYONPlK8Xa5+Kl1QCn1JX4o1VRSG2PUagDWkMUX3QsNxikLq2LdpVjXhpIV+Srqx7Fa
         UOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372239; x=1794977039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p31hRBuZ5v29aEoLLlgdY/9GGUqvzL1veqJRdGoKp7E=;
        b=Xc8SNbdonPADURpZhF7Z0soCX3+3DsN3l4pGN6hD9Wj+zZmgPFrHVyZpBPjsbezeoZ
         jt4VGrdel5KVKlM0F/PWSFQ4IRYN0Vz4HT/tVm7/ovrUl8PB5ykHj41jVvX+2zlAbEdM
         MiAgD410fDMGVgf37h9MM8mtBUw7mooR6auOkIn/1pDln9wpCkE45H2c/iFOKfGTgF6S
         qUY99ElzIXZu8L2Pxuzz/MKWqjVtE6O/B6z2X/O6kWEf6faIIthkmCUVK1/kP+NWYcEU
         lps1OLJfd1NTC8cCy9uu8Eg3mZFvgBuT3ChIxFmb0l1GZkhuS1EpT7ATA2mU4G4KJsh1
         pZ1g==
X-Gm-Message-State: APuU4Z+qnIgXTNJygUgY8B1O/OWcjN6Ka4qUsgrXjp7Q8UA5ZskYDeCk
	JjkX/Dl3xY844VTjLuIbjR4MO8M2WIQtB01ser8gvHbD/qT+t7WeUF8SzT6ZHWw2uOx4JlDC8V4
	JBuc4WzuLbbEFBbUA7eWPjkyhJxNikpLTf0rr
X-Gm-Gg: AYBFou0DUiVJ6swmcXxdaM0O3RCNEnX27GoSv9cBPqVId24kvipzCC7alRyBN+1z8gD
	d6wG9vegxsWSH4LLizIx2JqxYvUnM7mz7F7hev2hsSq2lTQFihjSok+CtD2q01NLTRyP9tLGBek
	mT674sEzDWXISKS+OemstcwRAI7jM2qukr/xpLS8gyxjSlDkS35PBnree+j3VHuwD9dte3kb/g/
	hJjrz/2Y3diWXe9M6JO4Vafz4GtljjMI1kcq2VZuhagrRm9ayA3OArenED5V1ImnfSFnFQVO51h
	pJCTFK9B8mN/iQ1my1zyBCPBK+ay/4zG3EhdJfaSeFA68QdihEpNjs3DG0SuqX/asBmmUZ+Qr2k
	vt/gEoAmfYpcJiw0UNy/SAZt5Z216lBi0Stp6mYMHuBC38zlE0jVkmHL551Bl9KbRKFyFeE9eKG
	vg88hYWrDFnnQLbjFUfB9yLWsHkgtyRobf7Xx1vC811BivOdcFiSUPmcep05Uk9J3K6+Mf+w==
X-Received: by 2002:a17:903:22ce:b0:2e9:6790:213a with SMTP id
 d9443c01a7336-2edd7b397e8mr15511145ad.27.1794372239006; Tue, 10 Nov 2026
 20:43:59 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111042746.14714-1-phucduc.bui@gmail.com> <sashiko-outbox-208300@kernel.org>
In-Reply-To: <sashiko-outbox-208300@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 11:43:47 +0700
X-Gm-Features: AclHuK9ir-MmdyEJwmsH7iSiqbs8LV1rrQVMYa6Y6nx83eIH1wY1eDCqtmpPl3I
Message-ID: <CAABR9nH9P5jOJ=Q8oxR9QMOKmttDh=-=jHsqnFR_szqzONgysQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Can enabling dev->pclk here cause atmel_i2s_interrupt() to dereference a
> NULL dev->regmap or access registers while dev->pclk is disabled during
> teardown?
>

This scenario is unlikely, but it is possible.
To be safe, I'll move the devm_request_irq() call below the clock
initialization
and dev->regmap setup.
