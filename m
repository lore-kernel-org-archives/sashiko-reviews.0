Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FB286415
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 04:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400079; cv=none; b=KS7+PtzNNiWbs8Vp/9gbQgXvRQLEu4kAj2653Oex/Aqfs2BGAKZ4puNCsCdU7tX6cSDrqHb3VA73JgWXMxysJiyGL2CjjVaP5J5c3ZD3cS5ZcMt3h90KuAmyMuTjtznXZN4OV9DfH8SX8pUuT+EdGbmbYtQmmnvQ6Mvr1IqI6Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400079; c=relaxed/simple;
	bh=kb60zbfA89OyEA3MIB/FOsifXnD30hWKiiEVbRbkXjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/twS12HJViwb2H45XQw6mxoisMLVpxZxQJT6+WWq1QHLgLzNNnLWt+bfl8m1dCkG7THYMWtAdrDyOgrLqG/J9rdA+H3TnyBw7gKZ3RT4kZRsdAH3dHoaV5JfVII3siolF5COalTHcZwjCwmlzFzrNuKdXlQFubwcbfdkioJGM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEjpWobY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEjpWobY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3487635b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 21:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400077; x=1784004877; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibd+yXAbv6+zm2PGw2sGUeLwGtlFhz0ZTLec7wv+mwQ=;
        b=TEjpWobYryMKztOTqkmKrLaLGoHSTwtzilghqUpZCFYSU+mRT46QZ1TK7bhPDzV7xX
         GLoDFNxH1jFR8fs7YJQ/t0Wpx1fMvtyp3TsUJ1XhqcEsp7PwkEqilZWNEi0MdF3yZj1o
         nx8gFJB5+r6KB7s4hPxmIB6i6CyUobNCNW8gt2eANjY0mxwfJBN6gCGO0kf0KPUYFfYB
         5rf2EpUPJvnG0ScGKhjv5l+woaRlc7AMv1e5sEwwDqZ/onvBXJwUIACXMDqDpYaZHLHa
         fheAoAee3yRfGDB3WUCAb4VMM0fj09wwWr1rp9/UavW9d6YO0D42yGokmrkxf5WCMNi4
         P3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400077; x=1784004877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibd+yXAbv6+zm2PGw2sGUeLwGtlFhz0ZTLec7wv+mwQ=;
        b=IJ+ZZqNnFVynnVucuAfM29X+QxaUACd/lXot8WBH3Zutvv4xVyhKo4wFzb5O2idGec
         OvW7+wAQM+8dUhPDpSlqN9teOat228z8t0oiamqL6RJpp5CN51U8IRFEaacC0BjKgR95
         z5uxeLTCJHhiSVWnkhsQix8/zRHPCeZeKV2wGn7YzHdBuhNmOenF79QdhtSxR0lsfll8
         yIARFayQiWapVolJL1VO0ZMklKYkXEtCyZ2XNpfCRfbSJworqa5VqftKk3eE2CS0SEWi
         4nnmudkmaVYgWUDr/BEgfxOwbLq7AvRR5cL5Iz/NGwgaZiwIUdPyFChKUJPBndsGEIlf
         dn1w==
X-Gm-Message-State: AOJu0YyVHT98L7nBNqi+LM52VPjY0M5npx9zf7DpydNqWSS1JF0UZlyV
	7W9DBeJlFyniTtJ4QUXK3MjsSCy3vn0O95PHLk+D1d6RsGUIlfL9NpgC
X-Gm-Gg: AfdE7cmdndoKfoY0v0WB9HQUjAVWJ+feGIk2lwl1mmSP+2cb+B/hMpolvMyssr/bbKJ
	e8Sr1yx6H66wTk1nhmo1fDqSGE7M00+Ji5AiWHJPhybRNtr5fVlmjCTswSjgc26wpHZlGsgHIjt
	knIY+v5eCSA9ztPHuUhmZWLqyAnnY29nKJIWH4po/kJIHpNZfpEPqeBb1bIzqK2UW+UFqEfwnde
	fZPnB8iJf9cKHP7K5cU8sAMhv7vosDfMjlYEzzisFEpNXX6R4QHBL3b4/8B5mLyqZU6/vswEliF
	ibQfE7jBsLJkMJz2pNorrr3nuxxZhY8X39/3FZQJtjh/iVw1dzOIg9bO6E6Kj2XOmogHeYU9ysS
	9DxPcDhjpd74+Jm1bB9Xu4f+YJZKRH1hK7eZsdyzyAGawaisyOxwHZ0Y+713mmsS6/Ddg/fu6Ar
	4R0dGF0jvM4qd1e5muuF2FoP8KuHUSlPrT5FOmHl4KA7wQptbaH6qy4g==
X-Received: by 2002:a05:6a20:7347:b0:3bf:b1f4:747b with SMTP id adf61e73a8af0-3c08ed0f571mr4685540637.12.1783400076823;
        Mon, 06 Jul 2026 21:54:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm4161788c88.2.2026.07.06.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 21:54:35 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:54:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-input@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Jin Yao <yao.jin@linux.intel.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
Message-ID: <akyF3Log1X8_FGIB@google.com>
References: <20260520183815.2510387-3-arnd@kernel.org>
 <20260530004519.1C8E81F00893@smtp.kernel.org>
 <dfe153e1-a3d1-4dca-a59b-59899082c4e9@app.fastmail.com>
 <ah-1z9LhVG0wtfBw@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah-1z9LhVG0wtfBw@google.com>

On Tue, Jun 02, 2026 at 10:10:28PM -0700, Dmitry Torokhov wrote:
> On Mon, Jun 01, 2026 at 08:32:31PM +0200, Arnd Bergmann wrote:
> > 
> > Hans, Dmitry, do you already have plans to deal with the
> > soc_button_array driver to move it away from legacy GPIOs?
> > 
> > So far I can see four possible ways we can deal with it,
> > but none that I actually like:
> > 
> > a) delay the problem, apply my original oneline change
> >    to 'select GPIOLIB_LEGACY' and fix it later, so we
> >    can make GPIOLIB_LEGACY default-disabled in 7.3.
> > 
> > b) add a gpiod member to struct gpio_keys_button and skip
> >    the intermediate gpio number here. Clean it up later.
> > 
> > c) always pass the gpio as an interrupt, as the driver
> >    already does for some machines
> > 
> > d) add dynamic device properties that duplicate the
> >    information from ACPI/DMI, so the driver can
> >    stop using platform data
> > 
> > e) disconnect gpio_keys_button from gpio-keys.c and
> >    register the buttons to the input subsystem
> >    directly from soc_button_device_create().
> 
> I tried doing e) and while it is possible I ended up re-implementing
> most of gpio_keys.c which is not great. We still need both GPIO and
> IRQ-only modes, and handling debouncing, both software and hardware, and
> so on. So I would like to see if d) is possible. The problem is that we
> need to reconstruct GPIO reference from existing gpio_desc. If Bart will
> be OK with something like below then I think the conversion should be
> achievable.

It turns out Bart was not on the CC list so I was waiting for response
in vain...

Bart, will you be OK with something like below?

> 
> gpiolib: Introduce gpiod_get_software_node_reference()
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> To support converting drivers (such as soc_button_array) to use static
> device properties/software nodes, we need a way to reconstruct a GPIO
> reference from an existing gpio_desc.
> 
> Introduce gpiod_get_software_node_reference() which populates a
> struct software_node_ref_args with the GPIO device's fwnode, the pin
> offset, and the appropriate active-low flag.
> 
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib.c        |   35 +++++++++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h |   12 ++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1e6dce430dca..63cef0fb02b5 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -247,6 +247,41 @@ int gpiod_hwgpio(const struct gpio_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_hwgpio);
>  
> +/**
> + * gpiod_get_software_node_reference() - Reconstruct a software node reference
> + *                                       from a GPIO descriptor
> + * @desc: GPIO descriptor
> + * @args: Pointer to software node reference arguments structure to populate
> + *
> + * This function can be used to construct a software node reference from
> + * an existing GPIO descriptor. This is useful when a driver wants to pass
> + * a software node to a secondary device, but needs to reconstruct a GPIO
> + * reference dynamically.
> + *
> + * Returns:
> + * 0 on success, or a negative error code on failure.
> + */
> +int gpiod_get_software_node_reference(const struct gpio_desc *desc,
> +				      struct software_node_ref_args *args)
> +{
> +	struct gpio_device *gdev;
> +
> +	if (IS_ERR_OR_NULL(desc) || !args)
> +		return -EINVAL;
> +
> +	gdev = desc->gdev;
> +
> +	memset(args, 0, sizeof(*args));
> +	args->fwnode = dev_fwnode(&gdev->dev);
> +	args->nargs = 2;
> +	args->args[0] = gpiod_hwgpio(desc);
> +	if (test_bit(GPIOD_FLAG_ACTIVE_LOW, &desc->flags))
> +		args->args[1] = GPIO_ACTIVE_LOW;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_get_software_node_reference);
> +
>  /**
>   * gpiod_to_chip - Return the GPIO chip to which a GPIO descriptor belongs
>   * @desc:	descriptor to return the chip of
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 3efb5cb1e1d1..c95b715a1d15 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -11,6 +11,7 @@
>  struct acpi_device;
>  struct device;
>  struct fwnode_handle;
> +struct software_node_ref_args;
>  
>  struct gpio_array;
>  struct gpio_desc;
> @@ -177,6 +178,9 @@ int desc_to_gpio(const struct gpio_desc *desc);
>  
>  int gpiod_hwgpio(const struct gpio_desc *desc);
>  
> +int gpiod_get_software_node_reference(const struct gpio_desc *desc,
> +				      struct software_node_ref_args *args);
> +
>  struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>  					 const char *con_id, int index,
>  					 enum gpiod_flags flags,
> @@ -545,6 +549,14 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
>  	return -EINVAL;
>  }
>  
> +static inline
> +int gpiod_get_software_node_reference(const struct gpio_desc *desc,
> +				      struct software_node_ref_args *args)
> +{
> +	WARN_ON(desc);
> +	return -EINVAL;
> +}
> +
>  static inline
>  struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
>  					 const char *con_id, int index,
> 
> Thanks.
> 

-- 
Dmitry
