Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F3F17993
	for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787396872; cv=none; b=TvOpRBdfIqVUGGStBqTqlL/tkkt4hT7nPRud67ei0p7E4YZ0l3ZuHyLOFhUKjogUmdYoYmZbHX5UDMQqgQpG4qh+HDQhjXskVpHki7WD4bwEx25FI7IBJvYVqK3DOMxsIzUxuq/5pcb9AMTYIrZQvK8L+qYIRaYwPaMbUjRiZEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787396872; c=relaxed/simple;
	bh=CAtfSaOlJkul5qUL9Z7j8iX7ecWOJLV3W8Iy9iGy7k8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G35CMDZ2JNIBsR3LZjOoTTSh/aWN8Yrlf3iRk0Ch/ctpxFuOQYjg+Z0AwmK5fnsr43w18h0uByOj4PZluNY+2qU66S1dCkcD2IvyiOFs13Kg+hpSpniT2YpTimbIXMim0VAcs9VQ9X2wj/QmElXEdbio+Nvo4ZUlG7yx+PB4fGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=vkYZHO8r; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vkYZHO8r"
Received: from mail.andi.de1.cc ([178.238.236.174])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wxjZf-00000003W82-0S38
	for sashiko-reviews@lists.linux.dev;
	Sat, 22 Aug 2026 13:07:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=q/82qXQCdNW2X0LkZzIrKAgGSD0VEdBo7O7SAFurDlE=; t=1787396863; x=1788606463; 
	b=vkYZHO8rN/LRQNcYqwsLK37t2PpYz0T9fXyYHVba4b2bn3wanyRzyYTsyAeYhyS89VBRxmvjFSr
	XEfvh//fUIhp8KMAjXdWqqLnOi/aQyhq31HbDQ5YZmGuuQtC7hq2JJH140cBH56J0/9mJRJQtHfXo
	fkDfppQ1b6tsqjaR23ahfo13d9GSP8UkHZmzRqPmRikIy2Hr1ReqBViTs96M3OEWJdKParn0MG3GX
	Q4Hjw6iQdGct93ODX26XPzSWrBt4qIpi24n6MIQYqUH8MTMlkwJPWaf7ayy3WVBAg2s5sdOxxodiC
	qfjxx+syve6EVUOl71qClwj/RvppQYeCoxqQ==;
Date: Sat, 22 Aug 2026 13:05:23 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Helge Deller <deller@gmx.de>
Cc: linux-omap <linux-omap@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] fbdev: omapfb: Fix __be32 sparse warning in
 panel_enabled()
Message-ID: <20260822130523.116aa1bd@kemnade.info>
In-Reply-To: <cd542bf5-775e-407f-88cc-4cf18305f2b3@gmx.de>
References: <20260822094805.421002-1-deller@gmx.de>
	<20260822095809.1D0651F000E9@smtp.kernel.org>
	<cd542bf5-775e-407f-88cc-4cf18305f2b3@gmx.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Aug 2026 12:23:35 +0200
Helge Deller <deller@gmx.de> wrote:

> CC'ing the linux-omap mailing list, in the hope someone with omap
> knowledge can judge if the sashiko AI bot is right with his analysis that
> acx565akm_transfer() might be wrong on big-endian systems?
> 

well, it sits behind the spi interface, which should abstract hw oddities.
So wie should not ask about omap specific stuff.

BTW: same issue in drm variant of the driver.

> On 8/22/26 11:58, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] Hardcoded little-endian assumption when transmitting the command byte breaks the driver on big-endian architectures.
> > --
> > 
> > --- Patch [1]: [PATCH] fbdev: omapfb: Fix __be32 sparse warning in panel_enabled() ---
> > commit a9e06be56fc1b74d7c6e76133e9ea1c25675a615
> > Author: Helge Deller <deller@gmx.de>
> > Subject: fbdev: omapfb: Fix __be32 sparse warning in panel_enabled()
> > 
> > This commit resolves a sparse warning in panel_enabled() by explicitly
> > reading the display status into a __be32 variable. It then converts this
> > value to CPU endianness using __be32_to_cpu() before checking the bits.
> > 
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608211811.lps93xao-lkp@intel.com/
> >   
> >> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> >> index 8f430d9e80549..0202ca8cbfc23 100644
> >> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> >> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> >> @@ -210,12 +210,13 @@ static void set_display_state(struct panel_drv_data *ddata, int enabled)
> >>   
> >>   static int panel_enabled(struct panel_drv_data *ddata)
> >>   {
> >> +	__be32 disp_status_be;
> >>   	u32 disp_status;
> >>   	int enabled;
> >>   
> >>   	acx565akm_read(ddata, MIPID_CMD_READ_DISP_STATUS,
> >> -			(u8 *)&disp_status, 4);  
> > 
> > [Severity: High]
> > This is a pre-existing issue, but while looking at endianness fixes in this
> > file, does acx565akm_transfer() have a similar issue on big-endian
> > architectures?
> > 
> > When acx565akm_read() calls acx565akm_transfer(), it passes the command as
> > an int:
> > 
> > drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:acx565akm_transfer() {
> >      ...
> >      cmd &=  0xff;
> >      x->tx_buf = &cmd;
> >      x->bits_per_word = 9;
> >      x->len = 2;
> >      ...
> > }
> > 
> > Because bits_per_word > 8, the SPI controller reads the buffer as a 16-bit
> > integer. Taking the address of a 32-bit int on a little-endian system yields
> > the command byte in the lowest bits. However, on big-endian systems, &cmd
> > points to the most significant bytes (which are 0x00).
> > 
> > Will the SPI controller end up transmitting 0x0000 instead of the requested
> > command on big-endian architectures?
> > 
Probably yes, at least if I do not see uint32 * as a pointer in the tx_buf there.
The more interesting thing would be the 9th bit. There would be some requirement
neded and documented in the spi_transfer struct to put things into 32bit words
if bits per word is > 8. Nobody would forbid using u16.

Regards,
Andreas
 
