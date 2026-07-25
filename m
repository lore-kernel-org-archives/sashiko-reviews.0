Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70341E492D;
	Sat, 25 Jul 2026 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983227; cv=none; b=LWsh5LqUwQY45ZbweNpvlbZ96EyU1mBF243JIaYlnhr+fYkSD1hHl4xeJeFFvjAhTtF9e1obUz6gLhmKdj/0JV8SFri2fyOeHNq6XO6xaZHaBzHz4d/DZkP7TsaorXRubYEvqI+CbU9G28n+a4TVTyvdpgANbS3ofRdzbnQ+SEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983227; c=relaxed/simple;
	bh=3m5Lq59NeHnwgoq8AYeCNVOz+jLB7H7BJqJCotZVcjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYeL7MMwlPEWTOpFjCf8jxmVLPmaUn8CilQNoJ70f/I70ptMjeVVo8S9dFmMZUCByzcj6A13B8bSOh3nr2b/HWCUQK3wY+OaCoeKbn2LwmU/SILhI6g1tY3s9pdAOcoXkb4o2zwrjKseFfmCiIu1Wi0GuGeWFZgfTkYBofOyCAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=aDcGS0Qr; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="aDcGS0Qr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784983222; bh=3m5Lq59NeHnwgoq8AYeCNVOz+jLB7H7BJqJCotZVcjc=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=aDcGS0Qr5EAI0vjkgdOjQvRC1woFkCelVfor5vog1X0nQOwAOohMrcJnpNaz+k5Dd
	 9Dl4yqPi2E0gN8p9t/60/Bfo0cm42LX7poOc5e81LdPKeIyduEn8GJeqGdATIcFOi5
	 Oz9LIbHj0S+v95O2dpsvae7WP8rnjOe46yaI1vaU=
Date: Sat, 25 Jul 2026 14:40:22 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload
 before CTRL write
Message-ID: <hx6r6lc3lmry3qzfvuiflsxc5oogbhkyfsvsxpt4ygfmoqfgk3@6ssdp3vthsam>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725113341.2250687-1-megi@xff.cz>
 <20260725114338.D9E801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260725114338.D9E801F000E9@smtp.kernel.org>

Well, that's what I stated in the original patch comment. I don't have the HW
to test. I can send a blind fix, or whoever cares and has SoC that uses the
other timer driver that may have the same issue, can do it.

I'll do whatever the real maintainers suggest. ;)

	.o

On Sat, Jul 25, 2026 at 11:43:38AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the same hardware limitation where writing to the control register while the RELOAD bit is set causes the write to be dropped is unaddressed in `timer-sun5i.c`.
> --
> 
> --- Patch [1]: [PATCH] clocksource/drivers/sun4i: Wait for pending reload before CTRL write ---
> commit 936f66d7fd8614d6358ab1a1c7241c4675c9fff4
> Author: Ondrej Jirman <megi@xff.cz>
> 
> clocksource/drivers/sun4i: Wait for pending reload before CTRL write
> 
> This commit fixes a bug in the sun4i timer driver where writes to the
> control register are silently dropped if the RELOAD bit is set. It introduces
> a polling mechanism to wait for the reload bit to clear before modifying
> the register.
> 
> > BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
> > device that would exercise it. And it's possible that this triggers more easily
> > with CONFIG_HZ=1000 which I use.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but as you suspected, the exact
> same hardware limitation is unaddressed in drivers/clocksource/timer-sun5i.c.
> 
> Looking at sun5i_clkevt_time_stop(), the unprotected read-modify-write of
> the control register occurs here:
> 
> drivers/clocksource/timer-sun5i.c:sun5i_clkevt_time_stop() {
>     ...
>     writel(val & ~TIMER_CTL_ENABLE,
>            ce->base + TIMER_CTL_REG(timer, offset));
>     ...
> }
> 
> If rapid back-to-back scheduling of high-resolution timers causes this to
> be called while the RELOAD bit from a prior time_start() is still set,
> wouldn't the write be dropped, failing to clear the ENABLE bit? 
> 
> Since this can permanently stop clock events and cause the system to freeze
> by halting process scheduling, should a similar wait mechanism be applied
> to the sun5i timer to protect devices that use it as a clockevent device?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260725113341.2250687-1-megi@xff.cz?part=1
