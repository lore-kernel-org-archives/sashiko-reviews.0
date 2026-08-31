Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02354CF70
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191309; cv=none; b=ep/hx71Za+zK7kc6B0z5Sg5goiwvO4ds/n9sAcSvU9XK/hqwuBv+hKniO6xlK96KzSPX1VteMcp/cTtcXaYe7P8AXJyPKaXSArmlK/mAzN04cvunz5yFSNgSuC8ATMqzZRJ5M0pT5xPdsnQHJjjCGf7MRyTVEbM29gEnndRQsZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191309; c=relaxed/simple;
	bh=B4q23QcyZOU803kPBuDAYqlch9MLSpY/C6zECX4IRtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KjSPVCVupljf4QMYoCJcuL+3maJOOvndqNPdRn1yfQliEJGIS0fez+IvvSVZuLcaMCwAhGqmkP0uIPH/G5ubS+ugNNONsK4QU6fAcSbgHT9J6XV0wrpr3+fGRRBT0D/yyTTM0zOLb9OA7l7D/jLe6p27Q2FuKT4yvqyHkpTn8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=3GmfDnF1; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="3GmfDnF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788191304; x=1788450504;
	bh=B4q23QcyZOU803kPBuDAYqlch9MLSpY/C6zECX4IRtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=3GmfDnF1WXVvlnqqE11jbgPw5RR7VCdzrHzjoZQpHa+gcniy4GnWSkMjDXwu9gPlH
	 6/bOSW702/LOZve9aPC2H0QYu/QpFMP7YU/EqdjI42bFrSrYZxA/3tqp2DvCvQChtu
	 3RXkHZIAEmFBb6m6vL5NEoM6W14bPY3nAzB8NeQ4Bu8t9Fe1vngPUscF6nDjaUgJPA
	 RVv3SxS4+naRWT0znaE1c6EU0DAuYYgC1amhIWalcVzPkC76KuLgodrXlcFrpQm0f0
	 i6e5XcicvDMYr997eBF//pMlnFV89EYS3nVd2YZdXEHp2C4M29HGIiAhaBMILxgDFP
	 aEpdIlcJZ7XNg==
X-Pm-Submission-Id: 4hYYLF4dCGz2ScPH
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <devicetree@vger.kernel.org>,
  <robh@kernel.org>,  <conor+dt@kernel.org>
Subject: Re: [PATCH v7 8/8] iio: accel: mma8452: Use proper error code when
 missing device model
In-Reply-To: <20260831122856.BC5821F00A3E@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 31 Aug 2026 12:28:56
	+0000")
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
	<20260831-mma8452-open-drain-v7-8-22946812c928@geanix.com>
	<GLsiBXMl7MICRWdgbnxO5JMAYIYQJNMOzCLl4lpTIqLags2We11Fx26bnL1jRGDutC0Si7dBWxu1SuQX4KbNgA==@protonmail.internalid>
	<20260831122856.BC5821F00A3E@smtp.kernel.org>
Date: Mon, 31 Aug 2026 17:48:21 +0200
Message-ID: <87a4q2uw8q.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Pre-existing memory leak of iio_trigger in mma8452_probe error paths.

I have a fix for this queued up for the follow-up series that I have
ready to send once this series is merged.

/Esben
