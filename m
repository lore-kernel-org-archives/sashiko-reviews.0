Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A3367B94;
	Thu, 27 Aug 2026 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844250; cv=none; b=DiUfkZ8FFMTA94w8Wr8ICxh6PaIYwPp8LvYV3LcMVd62H/2GmqjEPKVhOWWn7ZHvjoC4BhmUL1FWHRbeBOe9pn4bJTDL//hXS91MCuJl6LY6e7OMrCaTMnqkTvlG9CxJPLrsJ7OZ+UhzWkWsd5A2OBPSBQuHawaTLlCptDA5UvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844250; c=relaxed/simple;
	bh=xCsBRArtQOlXcEBVVAZGskJ9yhW8/2TLUCCS7V4l/jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A47DeqqBX+2BdpS9hWk2idL23kh83b4Ljm+XHsbZMYyaLAxJpPkZHHKrUu32+zX1addNJyInqG0NKSbf1+j0J/CJJyg6IgKjcFr6rUujkR8j+F0WL5AG2eKro5nzRE1QfmWQikHYREDmRKD77r6J67/tLHdg4ivXHSdRCWxhM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQS16A7z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQS16A7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653271F00A3A;
	Thu, 27 Aug 2026 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787844249;
	bh=qevHd4DzHs/J/T2zqw/1+MSFbPysy9aHGLu1eo3P3uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQS16A7zlvn7oCq3SxA5gVseJXoATjZ1UPe7sI8rqlXlL2iqJMmAWyZZR7gOx+gHC
	 NuGQZ0BCfYak+42VYzpfDqTrqeyxtmH9AmR59iTnmJevuMBN03d5ekYEiB/7kOnewS
	 6S45toKk7GCgsfq/uq8a15QUpDMHdK2gNPAOSqu+oysXEf6vCyH+OpqVXTZGVLEWUa
	 s0Rad6CSaWWEJIX8C+eOwaQA4mer0/5qkvb3H0w7x5r2v/gcbpkQe2ijN7FfO58uVg
	 Z7al3LjWKmFW6TA4+C+lqnTaytLOvBKTBwVKByiimbBpceCROkW5nXNJvlOOkl8ALQ
	 VyJkBXjTv2/wg==
Date: Thu, 27 Aug 2026 16:24:05 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support
Message-ID: <20260827152405.GE2943942@google.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
 <20260804154824.458301F000E9@smtp.kernel.org>
 <20260812112037.GJ1072730@google.com>
 <cc76739a-1957-4973-afb9-2703e238f0ec@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc76739a-1957-4973-afb9-2703e238f0ec@bootlin.com>

On Wed, 12 Aug 2026, Thomas Richard wrote:

> On 8/12/26 1:20 PM, Lee Jones wrote:
> > On Tue, 04 Aug 2026, sashiko-bot@kernel.org wrote:
> > 
> >> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >> - [Low] Hard-coded cell IDs are used for the newly added `cgbc-i2c` subdevice instead of `PLATFORM_DEVID_AUTO`.
> >> --
> >>
> >> --- Patch [3]: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support ---
> >> commit 4f0038d5dc42bfd45540675cdbf89f68ab3673d5
> >> Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> >>
> >> mfd: cgbc: Add virtual I2C bus support
> >>
> >> This commit adds a new I2C cell to support the internal virtual I2C bus 
> >> provided by the Board Controller.
> >>
> >>> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> >>> index 4a409234e66c8..81bd0a381ca13 100644
> >>> --- a/drivers/mfd/cgbc-core.c
> >>> +++ b/drivers/mfd/cgbc-core.c
> >>> @@ -240,6 +240,7 @@ static struct mfd_cell cgbc_devs[] = {
> >>>  	{ .name = "cgbc-gpio"	},
> >>>  	{ .name = "cgbc-i2c", .id = 1 },
> >>>  	{ .name = "cgbc-i2c", .id = 2 },
> >>> +	{ .name = "cgbc-i2c", .id = 3 },
> >>
> >> [Severity: Low]
> >> Should this use PLATFORM_DEVID_AUTO instead of hard-coding the cell ID?
> > 
> 
> I use mfd_add_devices() with PLATFORM_DEVID_NONE.
> So I2C busses will have platform_id from 0 to 2 [1].
> And I2C adapter is selected using the platform device id [2].
> 
> I'm not 100% convinced by this implementation. I planned to add new I2C
> busses and new boards support, and each board selects some busses. I
> guess it will be the right time to rework it. If you have any idea to
> implement this in a better way, please let me know.

Yes, the solution is to use PLATFORM_DEVID_AUTO as recommended.

> [1]
> https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/mfd/mfd-core.c#L164-L167
> [2]
> https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/i2c/busses/i2c-cgbc.c#L374
> 
> 
> Best Regards,
> Thomas

-- 
Lee Jones
