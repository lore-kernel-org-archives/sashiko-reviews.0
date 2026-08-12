Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A19417D7A;
	Wed, 12 Aug 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533642; cv=none; b=uqDwdTQgzUlCfHSGFz5UqKwtVIil5ic4R50XybRORpE/AISBnNpSoZ8h0Kno3rGMQRF+WRcKiTD7vy0pRrCSe1IhrLE+GuNu3WaeOsiNccZwkBQ7WNJPxg8khg3lHb5KtPm3Gy0/Mk9U/Ohu4PFj74fLxynYECE5obcx3i5dP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533642; c=relaxed/simple;
	bh=9A8Bhz2TfTVBJdFtGyPY+UuYkCjmAamRVnmIkozQJoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhFBS9xVzHZlxUT8mqS/qxnL2ecqIFg7dEiEUWpNQjsRwe20SZZNZfFjCUY95n72YHJj4sMYTBjOn40TVdMooBeW5g3WQ10X9byor4zYhnK3/hM54jOJZIQ42sYuiuEkFZ2NMFrJnhSr8bNjYfPL6gdVSX2SIBdM3K8yDG/RXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GULO7AVg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GULO7AVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB11F000E9;
	Wed, 12 Aug 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533641;
	bh=xjjekHDCD+ngjZWFcAGybvbD19AYt6LyIcYokjOW7N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GULO7AVg7KNJAgScpQNaFV/fB8NTEgsdTfaPBLAVc/9xE01wE2CZmkb1bcW6A4Tkl
	 OwXfw1VccHguO4yJUEVbW1r5+UvW6kjsFzsf5kJhVUOrCZrkAfW3BLo6XLxJLCOz7F
	 fQJ9644NGPsMrvJByAblb/SDM6FXUN8Gq6TkQBYFlcLj0XsDotLrAXIJgcAPFxeqa6
	 Levb1LOuKkgkSG+ftWISD/0tSzmsQqt2s7nKhV0jhNv8CL0FexKqtq1kU5upj1Ank1
	 1WcIDKHGkly+iuWakqQVZ4dUP2vZ3sNMUcnU3lvtKJxW4lCk/fh8JR4DPMoqRZs4Qf
	 OnJ6Txy9VjC6w==
Date: Wed, 12 Aug 2026 12:20:37 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev
Subject: Re: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support
Message-ID: <20260812112037.GJ1072730@google.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
 <20260804154824.458301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804154824.458301F000E9@smtp.kernel.org>

On Tue, 04 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Hard-coded cell IDs are used for the newly added `cgbc-i2c` subdevice instead of `PLATFORM_DEVID_AUTO`.
> --
> 
> --- Patch [3]: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support ---
> commit 4f0038d5dc42bfd45540675cdbf89f68ab3673d5
> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> mfd: cgbc: Add virtual I2C bus support
> 
> This commit adds a new I2C cell to support the internal virtual I2C bus 
> provided by the Board Controller.
> 
> > diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> > index 4a409234e66c8..81bd0a381ca13 100644
> > --- a/drivers/mfd/cgbc-core.c
> > +++ b/drivers/mfd/cgbc-core.c
> > @@ -240,6 +240,7 @@ static struct mfd_cell cgbc_devs[] = {
> >  	{ .name = "cgbc-gpio"	},
> >  	{ .name = "cgbc-i2c", .id = 1 },
> >  	{ .name = "cgbc-i2c", .id = 2 },
> > +	{ .name = "cgbc-i2c", .id = 3 },
> 
> [Severity: Low]
> Should this use PLATFORM_DEVID_AUTO instead of hard-coding the cell ID?

I had this question too.

-- 
Lee Jones
