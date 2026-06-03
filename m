Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CB3955D4;
	Wed,  3 Jun 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498890; cv=none; b=G5mcd+KsgcDVGiiM5n+6lRzwp6QaSRrXWsW4dIGyUZ6CZC8v6N8bEfFvoyapeQlmGmHt4ItfRAGkmeNk9oPymIkgu16fRlSBiOoORU0ZmmIgk6dXGw3x3Ul6VlpcLlCzWsEJhF0JNbNQkbik0pN6/JOT+ax8nDzlCFzBU66HoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498890; c=relaxed/simple;
	bh=LgXltxMEvS0dvMHIgwn9fgkjktVp4qKt4XiY3sjVHzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7LLUe8KpRn34aKxaDt+fSalqN3Qn7mENfGdMjVCCp2K2xbkj0XitfZG/OFjsibaHcknsD/efqjInIs8gKSRbrU/oQOiQVQGlgW79ndNNUXmLszA3KfFX/YI5jJxBt0wnKDb1Qd/x2gp2wVv3L7y9lcEiBvOyFNWa0txmuKJIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dD5L8wi0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GyyvPgXT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dD5L8wi0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GyyvPgXT"
Date: Wed, 3 Jun 2026 17:01:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780498887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgXltxMEvS0dvMHIgwn9fgkjktVp4qKt4XiY3sjVHzM=;
	b=dD5L8wi0h2hHti2VzsDovBJNUafowvQhaEUipkR/9/i+vRVSMplxx+A6foyldLqUCLTjLT
	NQEDNZMEuivumfWQmy2W2DGA/pbJZi6PZadmAHroTQ//hlzVrAIsedpAotQEOF0TaOjiTX
	czd1ofEy7s0DndJ8cXeBZVuJdRGWrjco0+u8pWUjXy9TcY+LcmgUs0KzsWS4RcPEmj/64a
	A/eJx/TSVRRYNx6oRERay20RC8KXtS3LenFLeaKImha/ytOLor1edCX+Wq79oGfsAzy4L6
	QiO1M8RJMWw4q5Nd+70V/H9wXpBA1/bVoz/QO2o9tpL6+CLYJ2MZjsM3EA9a8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780498887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgXltxMEvS0dvMHIgwn9fgkjktVp4qKt4XiY3sjVHzM=;
	b=GyyvPgXT4RYWBOWxvgg7YY4NtslwVrDwmE4u/DHDf7w/mtCDO9jOEiuTKbye8gTGuRdM2s
	9qDoqVCkZAZJikCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 3/9] mailbox: imx: use devm_of_platform_populate()
Message-ID: <20260603150126.AwpEcc9E@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
 <20260603133715.D22571F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603133715.D22571F00898@smtp.kernel.org>

On 2026-06-03 13:37:15 [+0000], sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unbalanced clk_disable_unprepare() on the error path for devm_mbox_controller_register() causes a double clock disable.

We had this.

Sebastian
