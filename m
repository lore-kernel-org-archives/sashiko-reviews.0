Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECD3C768B;
	Wed,  3 Jun 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500078; cv=none; b=QztUicJCH8vFG02ZpyflMLzB6EXQqD6Hf3xSxI2zP6gO2yYLOm6O8VJ0o7+lKQNHq0xURYRoz3ANu+doM92gAaoUaj5br+AT+Acv2z1SxVejfDqkYjo5rf+Y2ah47IWpOuxkQee83W/VucMLCoDtASzVCzor1oXrchIv4VqZMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500078; c=relaxed/simple;
	bh=bmT/80mB3n6dRXXEkMJn5soC27h/7oK51kADck7rKbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8u5xoxiRAzRDJRmqAaRcfdxipGY9Pkgz4RDOsQMrVjqqxEEin4Ajho1W6p9IPhzzwWBAfLUgdDSAK1kSiNmkb5sXErtKX6wUWzW6sm2elI0jLzo1//ipgCdupAe8nYCUvXcoijLN8HCRQJQtxN9K9DBXib9b7X9bgRIHuaoNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ro4/Ri1x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nxeXKjfQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ro4/Ri1x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nxeXKjfQ"
Date: Wed, 3 Jun 2026 17:21:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780500075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H1c4t5AfhRBRzmjLLfCYBrud3oeB03kFXvXYDkpCL2A=;
	b=ro4/Ri1xYJXQuthV1ytTU/sxip1vwK0EO9TclJBL9Gb72vBYlSdBIO6/rifyvKY9OV9yTn
	LYMVyOtLrfEThVb7E5LHaOjETW0ROZCXu4HaCLxrcmu/kv6lc2KQ8y4R7zn7GiXakq+FY5
	io3q76NYRRV8HgPpyPXM9u43xSEY6pw9mrvmnZ0ue7ZfrtJ8+yt1adwQ3knMTU0PdN0WFw
	e0SpW3l03OMvuyK0U8/SeTAGg968Lk8ngZ12kV48/JxOgJ3PVJDCLAoQJG2kVuDizRex2S
	7vfDP2UcblgYwxBzciyUXRTiKREcACjUZmiEhEwTv/LMJtAaIKcg2La+e7ebCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780500075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H1c4t5AfhRBRzmjLLfCYBrud3oeB03kFXvXYDkpCL2A=;
	b=nxeXKjfQZ936GPbeZD5D94/pYlIybwU+jAZnA8tPZ11DqTNV3iWRaVCypjI7Ov5bq8dCAN
	PVLsd3b9N+iXfEAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 9/9] remoteproc: imx_rproc: Invoke the callback
 directly
Message-ID: <20260603152114.yyI9ULYp@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
 <20260603144558.E433F1F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603144558.E433F1F0089C@smtp.kernel.org>

On 2026-06-03 14:45:58 [+0000], sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing RCU read lock around `idr_for_each()` executing in a preemptible context, leading to potential use-after-free.

No. The channel is removed once the interrupt handler is gone.

> - [High] Error paths in mailbox initialization leave `ERR_PTR` or dangling pointers in the channel pointers, leading to a kernel panic during cleanup.
This, yes, sorry.

Sebastian
