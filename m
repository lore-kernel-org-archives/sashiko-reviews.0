Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F837C11C
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910167; cv=none; b=ba5VXMq8SCCtwe+zokjxfcc2u0EDr7fy1wLLT+ncjYafTvDaCdu2XzrL1ox06iPidh18T/kzHbHMYHTh8vlQMgxrbWXQFOFqQmoaLzoHb1xJSlZvhQD4oKbXAHtR/pLVSGi3r0+soUsP6gsGwdTCEgMr1DWUAv9Ro24/vmpZoC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910167; c=relaxed/simple;
	bh=j8g0avxeHNADKM7UtFllwyHxJb1VZVrK26YuTdqL0Ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S1ewaxNNTp0Q0SCVc9CVdoAPfo/U91aVEXGSFzlTsVkkMBNOfxkGX99pFR8rjKUr51zyOsk7AnU8mVAbGPXxR5cR9Jww8Uo5ttG5yRUS8vd3Hbg7lc+Nb9XbwIPv4by6ayVPWGrueQcQLpVFeiJEA0ja6z4dNVaZtNEtlpwpvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=3CpKQ7YO; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="3CpKQ7YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787910162; x=1788169362;
	bh=j8g0avxeHNADKM7UtFllwyHxJb1VZVrK26YuTdqL0Ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=3CpKQ7YOpRRQgw53DFSvxH4Cf03+qon/DrBP1irM+2UXq8p2SDxh4fism+kOE4dU0
	 i9rIvjRWx4rVEoQqBW5PK/VlOSihnO3h0HzPni+y7ndH3bouUe2Q6S3K+OKAe+MyXA
	 ql0e5L2/665mIF5EgzNIzZxAu+KwLqtgK139Ke+XqtAzEIBc53pKowhZ3hj8NBUNbt
	 K4HY/MPZPoOA08aiG7m35JyT/B8zo/RZ78nL6tsrugyHwDzlWheFZbPKFJdK+x6d/D
	 4eOC/l1mE3V7Ndz65VceCFzoM0SjUWUlzrRzpF4ZS0ygLAj9YWXKTrXmjViudTwo88
	 vCGiSdXSEYPAQ==
X-Pm-Submission-Id: 4hWYMh6rYhz1DFFm
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <robh@kernel.org>,
  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
In-Reply-To: <20260825084232.C01211F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:42:32
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-5-9b252804ee80@geanix.com>
	<91GhVUP-80gkcISIz0dE2ynhBCleQAdud8LjQ0jw35yVrdKs2GYLWLJmrR5D1F66rapeWHP1SLbjJSWs5dv5sA==@protonmail.internalid>
	<20260825084232.C01211F000E9@smtp.kernel.org>
Date: Fri, 28 Aug 2026 11:42:39 +0200
Message-ID: <87pkz2y41c.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Critical device register configurations are lost after a runtime suspend/resume cycle because `mma8452_runtime_resume` fails to restore them.
> - [High] Sysfs read/write callbacks and write_raw paths access the device hardware over I2C without waking it from runtime suspend.
> - [High] The `mma8452_remove()` function accesses unpowered I2C registers and causes unbalanced regulator disables if the device is runtime suspended.
> - [High] `mma8452_runtime_resume` modifies device active state and configuration
> registers without holding `data->lock`, causing a TOCTOU race with
> `mma8452_change_config`.
> - [High] Read-modify-write operations on I2C registers in sysfs operations are performed without holding `data->lock`.

I will address all of these issues in a patch series following this one.

/Esben
