Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983FD446C1E;
	Fri,  7 Aug 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083770; cv=none; b=OwnhtUlBjinKUmAWDxlwRa9TX6ONxkBS3drY0HpQ99nqrQZLd9bYVzLrSZvklmcsXBzYdju/UovAEuKGUNAACAcEJHCMZb62e4Xoz90x/rmiDWqWcIZGzELA+vka/RIO4WdMqAtfyuUzTSKhi2WrjGA4ttx3dF3A/MJbTvf/C2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083770; c=relaxed/simple;
	bh=TQClskodylamYEW74Jg4mlXnUhaAnJkUCd6RVZdQ8+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfluOqxc9bYLQyuoca5GxDB1Vd0rZ9vwNiqkhYaMElCBfm2VhqLiGWG5yhZ5cJhCyKjxLkdiwi9OXzLJx+EhhEwkDEQAKVYYsLtkO1alrX64qpgwrmcCvPo32wEzsoub7GOIFiNJYQ8ZsvriRFWQwcERP1NRXzsz62Hnix7b4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=hFwrZcl8; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="hFwrZcl8"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:49c8:52ac:1f61:9566])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 30D88B00571;
	Fri,  7 Aug 2026 08:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1786083758;
	bh=TQClskodylamYEW74Jg4mlXnUhaAnJkUCd6RVZdQ8+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFwrZcl8PMqXeN6RApS9TsmOVuQ/lugp6pkNc16gEHr7PJjTazoDbPCCm6cClYKfV
	 dAxoKq+Rc8kC5QKAdpWGI1PgdPowAI8AYpLhN0VHHINdmkyQlVGgn7G/lsZYnNHCUI
	 7kBVMVafPRFGZ1FN150Bx005LQjI7kOhn+SdScQowcYGiCF/Th1rZoqjo6dre/49le
	 t+yV3yr/4jZiBiOwxrP3+bRM/rQNv834tjEnlxoEOX7r0WKw8ZT9tYe7q6ZcgeU731
	 vqSqFY1qsQ7HIl/wWPZuh13nYZhPWOAIPgV+FJPwif8ACeV7zDyelcWbOLBAylK5FW
	 10bGDptF3SbsA==
Date: Fri, 7 Aug 2026 08:22:35 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <anV5q2AZG67FMvS_@L30177.local>
References: <20260807-for-upstream-i2c-imx-lx2160-reverse-v1-1-f276ce8cb660@free.fr>
 <20260806224803.8CF921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806224803.8CF921F000E9@smtp.kernel.org>

Hi Mr. Bot,

> Pre-existing issues:
> - [High] Zero-length I2C reads cause a NULL pointer dereference and kernel panic in the interrupt handler due to integer underflow.

This analysis seems to be correct but it is not the purpose of this feature
update which does only "move" this block of code for the needed new feature.

The pre-existing issue/topic may needs its own specific "Fix" commit.

> Since the I2C core sets msg->buf to NULL for zero-length messages, does this
> result in the driver writing to a NULL pointer and causing a kernel panic?

I think your analysis it not correct.

thanks for the reviews,
  Vincent
