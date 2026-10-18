Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF87344DB9
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792336557; cv=none; b=r42x9i3SmL5vQ4FXdLUE4TKnekrzzsvtiJPzkLQ/YAEm3pUgOYx2i+HHNFQ9PJFDRMUUq6g2LsHeBKosvEMZrXKcyO4XiBFejAMd98mey6DJ2M/E6e9Q/EgJKNGVfj8Vd1f8KGtbaAhkTemf/3ewt9djL9MW4tz7N0+whdwfY+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792336557; c=relaxed/simple;
	bh=RUm21wybWqL1C0tU5LmH7zuYeC/MbYwsi6nzJRHIrMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F90i+FAY6DJl1vWDf2joCOtpPQhNizqx6azq3BFDI4+sR0OQxdrf1UjXk0Y9CwZexVgffUwx2iyNV4a3R9xLdgdx5eUQIsnTcFe+UoQ8rssCUCXXVbw6+EGUZMDML5DFgQZDhSsq9xRey+kkRsq+7Cyq8J19jO06ZMgtOU/VGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AsoCKV+t; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AsoCKV+t"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RUm21wybWqL1C0tU5LmH7zuYeC/MbYwsi6nzJRHIrMo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792336553; v=1; x=1792941353;
 b=AsoCKV+tOsUOtIoRNiId21Jp8WMKr8R3gbuepPEwuSs98nX5+tnvP7QH/WAS+DiWncjFC4Ya
 jj9Pl7ruLK4GPMWIcLnJgX8UzkfoUUBOT+b7y4dPHSMk1UA7ZS3QLH2bgsHgr+TcXtD602xu58d
 5zw8lZDo6DpxBZnAIewK65p8=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 73bd9148a1814069;
	Sun, 18 Oct 2026 15:15:53 +0000
X-Mizu-Trace-ID: 73bd9148a1814069
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5765e87.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 08:15:52 -0700 (PDT)
X-Gm-Message-State: AFq9FYIjzjgIG0dtjkcYP6Khb8g7cFxUKE7lShVvL1dR6190zO4QTCB4
	gTha+9PULqropi9JmtnfDrkOXnSfc0sjbA8TAuAjh72c4Hx7iSJx/xipT+BPwFv+MB0YnnPsmIY
	01VGEHwsiDCIRU17bwOEerptnbf9bUJOV4dff/8pQ
X-Received: by 2002:a05:6512:10d2:b0:5be:58ad:1ba4 with SMTP id
 2adb3069b0e04-5be58ad1cccmr43392e87.6.1792336551261; Sun, 18 Oct 2026
 08:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261018080921.3942517-1-fuad.tabba@linux.dev> <sashiko-outbox-176009@kernel.org>
In-Reply-To: <sashiko-outbox-176009@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 18 Oct 2026 16:15:14 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyQ-fMMAdVbNpRBRmABox9PT4qYZ7sA3_6oY8R4QVRnvA@mail.gmail.com>
X-Gm-Features: AclHuK8dSQbR9LjwbMs0rF-y41vhMpIYsrkhkNskk6dXGkghovZjiIfZf9BAEHY
Message-ID: <CA+EHjTyQ-fMMAdVbNpRBRmABox9PT4qYZ7sA3_6oY8R4QVRnvA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Only enable S1PIE and S1POE with the
 features they imply
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sashiko, I see you're on Argon now... way to go!

On Sun, 18 Oct 2026 09:29:22 +0100, sashiko-bot@kernel.org wrote:
[...]
> Won't a nested guest with S1PIE or S1POE and without TCR2 still leak and
> corrupt the physical PIR_EL1, PIRE0_EL1, and POR_EL1 registers across
> guests on VHE via PIR_EL2, PIRE0_EL2, and POR_EL2?

Yes, these trap through HCR_EL2.NV and no FGT bit covers them, so the
FGU misses them. v3 will UNDEF them along with their EL1 counterparts.

> Similarly, if userspace enables TCR2 alongside S1PIE or S1POE while hiding
> ATS1A or HPDS, leaving kvm_has_s1pie() and kvm_has_s1poe() unchanged means:

With TCR2 present, the world switch saves and restores all of these
registers, so nothing leaks. The rest is KVM's handling of an ID
register combination the architecture doesn't allow, which this stable
fix leaves alone.

Cheers,
/fuad
