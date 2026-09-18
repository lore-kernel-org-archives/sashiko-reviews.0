Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FDE4052C5
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742390; cv=none; b=k++mIkD/1UI6VLzUuEaGOfsO1EGXIVXtcLz0qwtACW/lMYSQTN5DqzWSh6pKX+CxBxDMjjXpiJ8K/slm0QvLM1tjgiFIqxg7JdtfPV1FHDLEbplzzi4WbZrP6EnyHRcTVnekm7uv0Ko0L0T3MfrrnNdYKYbkoCUYG/cMLVybkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742390; c=relaxed/simple;
	bh=1fftUoidy4jgxh7YVMqg1ODr71CmedOL1GmKoW63t4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hivjC/EN4SWox+lZ8SsOQSs7nuX3CBf5sPuJ/FK+p7/ox/9d2n3xK4yhKt4AIAC06xxZJ0Y71v3nWodbyONp55IuFC4YRx1DiN+hjhoJgOXCVi2FCea16acbasaxwDvaKB3h8mXEmQZ+mRwvnRMSZb834SMyyPRAxRYLT5s4w7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzsUZkRh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzsUZkRh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso6028455e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 07:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789742386; x=1790347186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92mac3At0JuDNMP0ZbTfo1sG6/Sn1KQAOj5nr4PadmI=;
        b=bzsUZkRhjjDLKK0e8PWy2lBnGnoASBFZQWegXxY+v2kXPEn7Z5dm0jHhpxXdriwfTX
         pO11DK2voISYb/Ye71GlkfEODSPdV1/jUbk/oe3rxG+PsLlnekQq7lBKAn6BeHxcdtnl
         lcRx168sPNtNHu6qXE75a6+A9VHV9xvOZAfv0X2quNT6vp+xq731XIMgy8WNeXmLl6Uo
         +SZYSbNDCpoFCE8S+60b0ru9tDA3tSD2m782oGrJOxwMnr6BhGWVGtaNGh7v5BEmSnoq
         e4nzyl9cTjb9CjvQXVmV4LDAzOAJLooQRhPMxNuMIEOF7/x7GWGklnMInbODVfxJvs4e
         DSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742386; x=1790347186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92mac3At0JuDNMP0ZbTfo1sG6/Sn1KQAOj5nr4PadmI=;
        b=PjDqlhhdYTaSJ8DWCelec4tnPSRLIkiku88LFlYp8wivX3Bwo+UhAX37pAoki3BII3
         siVdwuAw2Qr+L8mwBsmYErR0oSyoHg8DtJChd+KvqQxN7692F+j3ySPRxAGz0Ln0bZOm
         kk4pw1DJ9iFzKAtRaaBq/qn/Ay1GBU8mWKfwyqmk25dOKf4le2IPDka6PCg7gW2TVO50
         fEc6ASQaSKHScoBu73VlzJ4LBKZs12A+9cOqoKL0bKxmxQrb9UVlwprmZ08QSox3vuPH
         LUFvP9JbVnQ0DOqFh6Elc0lcOYlVWLc1VnaSBJ16lQMdkt84D0tBWTGlc3ZDJXSMk0iU
         jDdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGa/9HtqbzeQa9n4wedZDz7Zsd/VS6pB90I165xubRE2f7+mIuEtrMn+AVG1JbX7IfhZcPqOSmKZDoUVx2DdU=@lists.linux.dev
X-Gm-Message-State: AFuF++m4H22+fCuI1Y6EBekjuwdQ8zlCR/4PQoMcS9PB3c6gStIwnRfu
	Huqnl0YuCcnnUvcLF194xcpE0p196BZWShOGSt7M94Juh0bU0FeX/Ve9
X-Gm-Gg: AYBFou2FAJDALj6S0efDa5onZHCWmVBj8e1T6ZWC1zpS6IkRmL8G3BpIUGwE1gcDhyS
	LEvB/r6ayKkPEI3/gr3JeOrkWxDKSrAiE7OEy2dq5fwo42KJqyBySkNK3dw/vFXVDAFWcU4Bdok
	vgQX7RxDwwLKqDd4rCY0qAnGugEg/M+j1MLADsual60qAtiqAuG8DI74WHljKtUutrb0GoZOiXw
	lj+WLLyMwSHu6It2Q6I4PHxHobj0TRIOuU35mVtjJtRkpeHfNF+jtjq0yeJTFOIslsJ88/naFg7
	HXJh28hl8VCn4yMQL5bsgFXq0PG573wl8p67FUHPHj9okApjOFtoYPaei3GtvvTR7MA5kA8SLtk
	vSJuUX7eOQY2eRMcQoMaD/dbyi1YkmQwpt51PCND5+CK4mw1i5yYAzgzz8z++o/aqbet+mXpvu3
	PvE+WzmPvrb5k/2QjTwRZg8JLWvEiiv/iheyAdlFm73k/5K3jkhNUCXjFaTRrpniB1y7uR5U7re
	lZFeCXvWUUpSdU=
X-Received: by 2002:a05:600c:5254:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49fc56732aamr36801425e9.5.1789742386348;
        Fri, 18 Sep 2026 07:39:46 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcab7e333sm45448015e9.7.2026.09.18.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:39:45 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	tasos.papagiannnis@gmail.com
Subject: Re: [PATCH bpf-next v9 4/5] bpf: Mark linux_binprm->mm as trusted-or-null
Date: Fri, 18 Sep 2026 17:39:21 +0300
Message-ID: <20260918143921.10931-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918140305.C88251F000FF@smtp.kernel.org>
References: <20260918140305.C88251F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Critical]
> Can this upgrade to a trusted pointer cause a kernel panic if a user loads
> an fexit program attached to free_bprm()?

> Because free_bprm() frees the bprm object before the fexit hook executes,
> reading bprm->mm yields a garbage pointer. Before this patch, the verifier
> automatically inserted a BPF_PROBE_MEM exception table entry to protect the
> dereference of the untrusted pointer.

> By upgrading bprm->mm to a PTR_TRUSTED nested pointer, the verifier bypasses
> this BPF_PROBE_MEM safety net. If the fexit program checks for NULL and then
> dereferences it, could it trigger an unhandled page fault and crash the
> system?

I don't believe the fexit/free_bprm case can cause a kernel panic.
My understanding is that in fentry/fexit programs, the arguments are not
trusted.

The trusted-or-null annotation is only used when bprm itself is trusted
which is the case in LSM programs.

More specifically, the following program did not result in any kernel panic
and prints 0.

SEC("fexit/free_bprm")
int BPF_PROG(fexit_free_bprm, struct linux_binprm *bprm)
{
	unsigned long arg_start = 0;

	arg_start = bprm->mm->arg_start;
	bpf_printk("%lu", arg_start);

	return 0;
}
