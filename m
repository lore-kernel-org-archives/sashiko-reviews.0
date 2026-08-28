Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C36518A6DB
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898385; cv=none; b=V9ccitLJMGFrfE1ltfs0AK4Tbsl8ZUB4456JLuLaL7iJHWNaz7CR/NqJAAPySw/RtC4oQbqSNbDhPXB7rMM8eHQBjX7lvy1KnwXIjChUddMLLEznyn3trYxBa61vI7e/rL1u/bSQ+bqgIRnS7YZHuw1d1JfeZ17X1HeV7+6WXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898385; c=relaxed/simple;
	bh=dlW18YWNxkC2fSzEk8876nnvyCStamQX34bD9p999SE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uzFIsUyly7wDi0D9v8F+EkFXGCLhFp2uya/xTO0hwRRW3IkpYF7pU5/VuJeCBzjEb3fCE3lkAvGVHyjqPWOc7GfdXlTttrTsfhhdLCzUtIJiEbYYZopjRq5XWZg86OnBk/3BCYfVlKJiIMeHi2uJ4o4m9/NABYDd+KCY314fz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=202hciAQ; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="202hciAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787898381; x=1788157581;
	bh=dlW18YWNxkC2fSzEk8876nnvyCStamQX34bD9p999SE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=202hciAQwTWc3Xf0boDKSPlxWSYfNfphBCcX6uYBF4Z1XDkz17/NU+w0MySfhtfXS
	 IM7zI7wZ8/Gazb/jQ9uxGSzyaLim09jkZX6AZCqA+iCVOhjvkkVxCFiyikzrLhIiw5
	 kZzxepYbeVZAz7uVvxnhoEL4MIVsW/2HTEKjPlo0JsLKNYAtjOA1v0vTCr/M80jh2c
	 G85xd5dCtZt9+e0Lz9L5uuZFSK3ts1YJf8S8ZzbM3l5f6fu26g8GAmGaT1qeHgaOhm
	 JFx9lwRQ4yctW3yxmNYGaGNd+mytSZMgWiXZnCbUiYv3MCrO4mnoZhjls6bJpGWYcz
	 isF7T62aaT22A==
X-Pm-Submission-Id: 4hWT176rjLz1DFFC
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <conor+dt@kernel.org>,
  <robh@kernel.org>,  <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 8/9] iio: accel: mma8452: Fix use-after-free bug in
 error error path
In-Reply-To: <20260825084130.89DBB1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Tue, 25 Aug 2026 08:41:30
	+0000")
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
	<20260825-mma8452-open-drain-v6-8-9b252804ee80@geanix.com>
	<W9ZqRehtE7ZLcZllxMFSwVPYmZeL0o9GGwdGth47b0VSuTt7i_F0DOJmyxWZItNG8rE2dmmNYGAaay_mk-xATQ==@protonmail.internalid>
	<20260825084130.89DBB1F00A3A@smtp.kernel.org>
Date: Fri, 28 Aug 2026 08:26:19 +0200
Message-ID: <877blazrp0.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The device is left in ACTIVE mode on probe failure paths, potent=
ially draining power and asserting interrupts indefinitely.
> - [High] The driver leaks the PM runtime usage count on multiple error pa=
ths when I2C reads/writes fail after acquiring a runtime PM reference.
> - [High] Time-of-check to time-of-use (TOCTOU) race condition during read=
-modify-write of I2C event configuration registers.

I will address these 3 in a new patch series after this one is merged.

> - [High] In `mma8452_runtime_suspend()`, if disabling the second regulator
> fails, the first regulator remains disabled but the PM state is left as
> RPM_ACTIVE.

This is fixed by patch from Sanjay Chitroda [1], which is currently in
iio testing branch.

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-=
open-drain-v6-0-9b252804ee80@geanix.com?part=3D8

[1] https://lore.kernel.org/all/20260808-15-apr-pm-iio-mma8452-v4-temp-v5-1=
-d177e93ce3f8@gmail.com/

/Esben
