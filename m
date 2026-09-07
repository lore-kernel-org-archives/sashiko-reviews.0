Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9346F497
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793781; cv=none; b=j5+xlsq8HIGRkWmJ7v2g5B/sx8PEFtkqfX4mlVzOkF2p4u3oacK9dLrbzpUDltV5SEu5cklKLLqCL6NKRmST1KvoRTTpPFPJcMb3ateoBjpEH+D0MOGB2Y2LjRpGIjI/Y0z8Ce7XmCUEX1ruj2Up/OauDQlZM2Q5IhdYZlI5rS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793781; c=relaxed/simple;
	bh=+IpzbL/56KgqjFNSSDGyvZo/X/5nI8J8XwS5pVhG+xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=th6Wj8+FRj2laKdnuOu0qFCjVC0AlV9Csq0ysoZUazcumKtohJpg5LzOemQ7AyyPA+JnYAdxcE//r/PYPRoKUbFBPE5GAX8VuFpvOHHBDwUc9Y3AhGeUe3vxjr0/H1ipvqIrlsBEeXKRoJv3ruo9kChdFyawirBBM+hdLjp1so8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=6oXMD7sC; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="6oXMD7sC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788793777; x=1789052977;
	bh=+IpzbL/56KgqjFNSSDGyvZo/X/5nI8J8XwS5pVhG+xs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=6oXMD7sCN9Ej57foFx4agdKvM0+HZ7zU48QwjhukVjeD1yIqaVyXpzeDix2ax/Ayj
	 9g0T295xOBOtSIKgg/lOyYGIyzbvJ5pDBahUnyHTR59ygSvKehPgQSBDwEWGhX1pn0
	 LzySHrEjf/ru+g8a9zK6aVjnm10J0puvmtrb7Xf4emBxZZA6964COdPeI4eGiImJnO
	 FRMPcmfpOOsifQ3tsYZl4IHzjACSBTmmJPc0/7sHIh5J1GUJ6kJUuhQagpQrITFvhb
	 W8FHEdBkSSJKqEzDB6g/qPNX5vgaDyEJ3tLCDSdilZh/b8L6lT/hB7uEeY51Eiu581
	 XHuLOwXe41DJA==
X-Pm-Submission-Id: 4hdr8H3ZZwz2Schr
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,  <robh@kernel.org>
Subject: Re: [PATCH v8 7/9] iio: accel: mma8452: Allow open drain interrupt
 pin configuration
In-Reply-To: <20260907150535.9331B1F00A3A@smtp.kernel.org>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
	<20260907-mma8452-open-drain-v8-7-c17407e22118@geanix.com>
	<5W-a-M2VxaT4ZqQf-nxXwSAyAL_1_FN5pmHAVRdX1oiH6G8F_YAeMiwEKMY69n6MfKMsz-QzJHzSehHMcy2YlQ==@protonmail.internalid>
	<20260907150535.9331B1F00A3A@smtp.kernel.org>
Date: Mon, 07 Sep 2026 17:09:34 +0200
Message-ID: <87se3l85e9.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Hardware configuration context is lost across runtime suspend/resume cycles involving power loss.
> - [High] Raw reads fail when the device is idle due to waiting for data ready before resuming the device.

Adressed in the next series for this driver. I will finish it up and
send it when this series is merged.

/Esben
