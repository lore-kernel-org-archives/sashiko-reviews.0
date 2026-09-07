Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA74F797B
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793729; cv=none; b=qELPchKmkxc8E/W70vvQPanSu21SFZZDZ40iyY1PR5gFPqx9uj4yW7yRUDDovI/sobO6ur/RclhI90Rwk+1yMaepCuIpyRDtVlqk2lTTSB5fUcL4kk+Y/hDESi4g/J84OC9LkzcTBgW6/ON6uI+/K7WvIdFdk52zNUm9vsRcfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793729; c=relaxed/simple;
	bh=5ADR4z8UwjRbvLyKpJ1+r1liZ/NBIpSDg++0136zqcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nZtgP7aRlBnvx94nZhcMx4qZC4YZJ0058bYbRqXd5iHmV577rzzmeVrAo+Q2+qBPnjYy633DfFtwDnQwqXPOMWg6Ui6drE78q6xHQpmexNQRRlmCzu8DEuxMR76esXC8eChljm4znK5PN/YXsXNs2ouL77XhsNXFvVPkAVFyB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=aVV6pgEC; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="aVV6pgEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788793725; x=1789052925;
	bh=5ADR4z8UwjRbvLyKpJ1+r1liZ/NBIpSDg++0136zqcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aVV6pgEC3tE39N4OErX5+krKGG9589Nzay83pK2ptJYpfq0b5VWoap2MDeF0nLP/E
	 ZK0W0piJKk3/7h0Oda/H2bwbwRGvYrM82KVDMkA9KEfIsYE4XmOPPEVP/PJTKNMXds
	 Bm9djdSCAAY8xuuAntkZM2vQ6DORxadnIVFfJmqEbWII/hC22jWG0aUARG98XBqfvE
	 x/W+YW3NmHapbBSzgnGK8ovMAdrJ76TNaRN8fECH8CvFS7cmLMB5zw0+2g+gN6Q3Uk
	 fDuNLuQ/9RhMJnEZ3sIuJVXYZBSoR7arabSRT7s9+2c6BZWE7fvWgHTJ1l5O2CbcD9
	 E9v66dbUYm5dg==
X-Pm-Submission-Id: 4hdr7H5V5qz1DFSL
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH v8 2/9] iio: accel: mma8452: Fix use-after-free bug in
 error error path
In-Reply-To: <20260907150439.CCE271F00ACA@smtp.kernel.org>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-2-c17407e22118@geanix.com>
	<-EVoZXXwgVeWsL7YKJVpWG-I7MBt1Rb-T2FKbt9_Z57kVHlgFqMZjeW-eAaiwqE-JX-euCRDHFW_HK-As_hzXA==@protonmail.internalid>
	<20260907150439.CCE271F00ACA@smtp.kernel.org>
Date: Mon, 07 Sep 2026 17:08:43 +0200
Message-ID: <87wlsx85fo.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Missing runtime PM synchronization in mma8452_remove() leads to unbalanced regulator disables and I2C access on unpowered hardware.
> - [High] AB-BA deadlock between data->lock and PM runtime suspend
> - [High] PM runtime usage count leak on I2C read/write error paths.
> - [Medium] Missing device standby transition in the probe error path leads to a power leak.
> - [Medium] Unsafe hardware access during probe due to lack of runtime PM reference.
> - [Low] The driver unconditionally assigns its dev_pm_ops structure to the driver.pm pointer without using the pm_ptr() macro.

I believe all of this should be addressed in the next series I will send
with changes to this driver. I will not be adding them to this series.

/Esben
