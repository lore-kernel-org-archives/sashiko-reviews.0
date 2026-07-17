Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FC3B14A9
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274221; cv=none; b=oa+FgS0EJ6Rcg8S98fbDgkkxmtIDfJcW2mKGg6gFsqxDhoEutSpiS0qlEIqV0SC96SSZVoA0CI4guhs2txcNYtzQXey/nGQHQuUX4XSmDzMA6BQjzlqppxGRGBwjcdGdLc2KYZKAGeY4keLeIzw8MnTyosWMy51MtLgPka8ufpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274221; c=relaxed/simple;
	bh=Urk/9KPk3ayArc4UMw3Aeg8AJXlBJ7zpgKP1D40mwBg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iP10FLwUbs6VJ0VwS9IsIfNHMRKRkdC3AWy3o/cCb3FSRLco7ooVyrDcu4Bjrs78UY6sP2oxOy65ppOTrW4ixU0l6OL8qLDaNQDlhHermmDb60PtB844QgY0Guxpqr3/1Ll8xh5LZ3b5/2IkkJmH/pSPKeU1V0JQctiP5EtAVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zTeSnpIh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zTeSnpIh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8702A4E40E16
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:43:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C24960361;
	Fri, 17 Jul 2026 07:43:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF99711BD0163;
	Fri, 17 Jul 2026 09:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784274217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Urk/9KPk3ayArc4UMw3Aeg8AJXlBJ7zpgKP1D40mwBg=;
	b=zTeSnpIhXLcrzeaLxDjqjQNCfM+hEfluQk1gkQHeCGJQqHjA+UK4/1LUyguHYzyARobCix
	cgJwkJ3MlFyCw4Zx7Az8QA3GG59MiNwzQsbgUF9Hwmwdqx3idF3NJ51Rpb4TsUNXF9sYsZ
	WlfsHBIbKYqxCW6oXOMh4Ig2vqOtymixWoV0/hLGuw30mypzsWDfZxjhqKUvEMvU9rcaej
	+C9KySd2Lenw8SGOyICxPyPc8kbHzOYq5TnMhaK7SrPLEUnjBsip6ZvAlMe083PDg4NnJA
	9RcmQNybFI3R/JGrpKGiTUUgQGp3IAWJ0272YWm9VRaOxOllOfpp6uZNa1uZIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  devicetree@vger.kernel.org,
  robh@kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v3 6/7] clk: Add support for clock nexus dt bindings
In-Reply-To: <20260716113708.9CED11F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 16 Jul 2026 11:37:08
	+0000")
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
	<20260716-schneider-v7-2-rc1-eip201-upstream-v3-6-98454e83845c@bootlin.com>
	<20260716113708.9CED11F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 09:43:36 +0200
Message-ID: <87jyqukqmv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 16/07/2026 at 11:37:08 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Unconditional dereference of optional `out_args` pointer in
> `of_parse_phandle_with_args_map()`.

This issue has been addressed in another thread:
https://lore.kernel.org/linux-devicetree/20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com/T/#u
