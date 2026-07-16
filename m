Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A2426A08F;
	Thu, 16 Jul 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232125; cv=none; b=pkqCp1HvJFMyxVUXuUHh/BQHXB5yLQa6zo2Md8gL4jEw/Dtohfgo8PKpRdUyRrc9NZ1DlEMwYk0xDgPcoNL/tPO9gEM0mrezcqkzub8eeJehj5B4FpJe8uRX2vSqawHAZRwwac1LAd7+ODS2FqXybd2zre9LZlRg9VbTWa0veT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232125; c=relaxed/simple;
	bh=Yxs2nqD9XRl+rIle3weDRqx4hTnzFohqYVnt9MduvOI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rVWcea+EFsSK8Be32+xeXCvR0WDeuuS6sq0HZDYGgmaS8Z7Ye8XlJgsPOsMGQ1szhEKYbS3Lsjg6TPbIld3ZOUsR/Xe1Ij7of5EYIJk14uKSDuVOBJhgjHOkmjxvVD9Yk4cYS/bWife4l7bu0Wijc7RsiaBs2+CWZiTorUpMUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aT+L5GHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aT+L5GHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B29C1F000E9;
	Thu, 16 Jul 2026 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784232123;
	bh=vHCvd1TgKcqL8918AXMBAd80n9yhDnH3tkghOy7m9X0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aT+L5GHk16IANB5z1mWVTcPy1oaG4YqxTJH8IRot0lWtNxjwIKbY+GgOMQAqS3LO9
	 w+3jyPJG2nr2EA1eXMn55kqQbdYtefEs8I0oMx1jZavUt+99M1LIsvV/JmgazpmNeY
	 Ip1CRn/DY7KTXwaBYblyqJoiyQP1Fac4rZS2WZkpHjGtniFsMkRz4aM2Jezfqu6GRk
	 dpOyRkYfo7WXHW6WRIAsqJa+upDes1k8C98pTKAwZ+xCA5CykV64PWpGbhcfXBrcOf
	 Mx17MkQ85Nnm9YTI2qNHghb5HKR90zL9VD5vcvNHlrTo1F96uYkYsVwHksvVbVjrE5
	 wT47dJcgfZOoA==
Date: Thu, 16 Jul 2026 22:01:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, sashiko-reviews@lists.linux.dev,
 guoniu.zhou@oss.nxp.com, Frank.Li@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [media-ci] Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel
 formatter v4l2 driver
Message-ID: <20260716220159.67443b8b@foz.lan>
In-Reply-To: <aljVwX1wzPqV3c_7@SMW015318>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
	<20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
	<20260716072052.A20961F000E9@smtp.kernel.org>
	<aljVwX1wzPqV3c_7@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 07:59:45 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Jul 16, 2026 at 07:20:52AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> > - [High] Missing NULL checks for the return value of `v4l2_subdev_state_get_format()` allow userspace to trigger a kernel panic.
> > - [High] The driver caches a pointer to the remote subdevice when bound, but fails to implement an `.unbind` callback to clear it, leading to a Use-After-Free.
> > - [Medium] Mixing `goto`-based error handling with scope-based cleanup (`__free` and `guard`) in the same function violates kernel cleanup guidelines.
> > - [Medium] `csi_formatter_subdev_set_fmt` partially modifies the subdevice state but returns `-EINVAL` if the stream has no active route.
> > - [Medium] The `csi_formatter_read` wrapper ignores the return value of `regmap_read`, potentially leading to uninitialized stack variable usage.
> > --
> >
> > --- Patch [3]: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver ---
> > commit 0cff6156940653a6a408d93ee678b339b7218ebb
> > Author: Guoniu Zhou <guoniu.zhou@nxp.com>
> > Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
> >
> > The CSI pixel formatter is a module found on i.MX95 used to reformat
> > packet info, pixel and non-pixel data from CSI-2 host controller to
> > match Pixel Link(PL) definition. Add data formatting support.
> >  
> > > diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> > > new file mode 100644
> > > index 0000000000000..cea60327c9729
> > > --- /dev/null
> > > +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c  
> >
> > [ ... ]
> >  
> > > +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> > > +					       struct v4l2_subdev_state *sd_state,
> > > +					       struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> > > +		struct v4l2_mbus_framefmt *fmt;
> > > +
> > > +		if (code->index > 0)
> > > +			return -EINVAL;
> > > +
> > > +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> > > +						   code->stream);
> > > +		code->code = fmt->code;  
> >
> > [Severity: High]
> > Can this cause a NULL pointer dereference?
> >
> > The V4L2 core does not validate the stream ID provided by userspace in
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE against the active routing table before calling
> > this function. If a user passes an invalid stream ID,
> > v4l2_subdev_state_get_format() returns NULL, which is then unconditionally
> > dereferenced here.  
> 
> Is it true?

Yes and no ;-)

Technically yes, v4l2_subdev_state_get_format() can return NULL on
several conditions if it can't find a state/pad match or if
state/pad is invalid. However, the call_enum_mbus_code() is always
called via a wrapper, which runs check_state() first, validating
such error conditions.

-

That's said, I bet other static analyzers would also produce the
same warning, as the check logic is indirect, using some complex
macros.

We need to create a custom LLM media prompt to prevent such
warnings from LLMs (or reduce the complexity of the wrapper code).
Perhaps improving comments at v4l2-subdev could also help.

I already pinged earlier today a Sashiko developer to see if we
can get some help to write a prompt.


Thanks,
Mauro
