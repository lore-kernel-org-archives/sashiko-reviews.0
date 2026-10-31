Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417097;
	b=Mjx24qDqFxGS+dzPO4pZrTC+AVjQaygOmRowB5/BQEFEZ78MYk90nN8PDpCo0IOB0nJo
	 cEzMX9mGM7qvpY4DFQqShd3M7TY6gaFadXFkufHLtyz8OnUo5/GrtaQyoPiPRHhDy96yu
	 G+vNOPUlh/0BUn7+HmfCKls0p7R8kdKQi5hrGJuyxWlM5YwaVVkdqq3R10PxhaEAh0kME
	 I24v6tQ8EVrF7V3Ld9B43MQWm+eVHs9PIgQryccdsmGTWWM+NxaO+NIK8u5ObZvO2YJnd
	 oYt1lqbkZy5RGjT5C05NDXxJ+sthSIr67nPQDdOVOKCqwk1g0ApnggHxPHcQnu5VwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
	b=AYPkzshJjz0U9FTXRFB0zIzKDHR39AtALdMUYddlcHdzkFn9ELZUlJ3bYTQHk3eUSjZj
	 0PTGp7YWY+0r/xTZad2B3gu0skK4tDBf6aN14RypMw7LA+Coz1fGfCJniM9Pc82IJcji4
	 +2xqWEhYFUH4rI+e5SwmaHgSRd1qiSkKA/sK3ebH3H6fvfjsiTEyBMu3zoOJYwTbakABv
	 w8MMNrwTTXUw7vVfVPlBXqejll0hpO73w6qDLVadlOOGeVP5niG02fTCt/sLo6AY8lB5+
	 oJOJdIzj2eqyJh/OFnW3DNNUmerbs/GzqOAb3kiJl/ykM+dpqn5GN+7/l3V29EmXbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18907606A324
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 03:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18907606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso779025a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793417096; x=1794021896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=LKQ0FFxLI6uB1bJ0tqtw6QcH6/a13eITOx+AM6bRhsKH2ck+ofHp6ZE6isO6QaP6ke
         CqWL2Mb50QW31zxy7gk0zRjMYfxZwDu8mgVVPDnVB6ZgUzGZ/p1T3ILPoYze1Uzu4Tm9
         nkOBcs86eT+0wAey13DVSsZO63X13sHC4QLG6Z6MeSBAhzApmslcttWmrAO+vB+UypCF
         FxWGTU4kP+e0hTXH4QMG6XcXGNC4MMyfPUlBszczsv/zjHAM8Jpr9RixXInCL8oswJwj
         z1JbQ6MD/t8UCCbBlMUpN/97uNdEbeSRii8FNs75f0BUjBGix0OGCEZF7yQLDi37ecjd
         8snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417096; x=1794021896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjFmgriWXzydd1YKnmihJ3tonTeyGDj5VqBui4OA5C8=;
        b=Tm78I0pXUix3sQrA2BSTjuEway5VenNOAOLwTdd7YmL2X6KCGHjQYPf6EaTrIUd+2N
         RwpfNJssNrVWXmXSXoV6fMU+59g+Hy1e6SbW8BgvSjXeKvxE/6CvzMdQAqLmqxUtmt9x
         5LOLjzABHx0VShLp2bMpzLep+yXXqfVLFjHeBPYFAqNLtW3mzSpA1f6AP7ussQfOsR2G
         kxXBYIamoTchbYaxjirTUqOubJ7n0JTitQWTHJZnxqHXIKkMmYbwfgpolQOUhbpECJbn
         euBupBR3xGHUW/EclKnpzDMTnWNSfeWeeZWDEFoX8Li6839wuVH/Q4xxfjB8ZvcIgcEL
         s8gg==
X-Gm-Message-State: AFq9FYIGWJikKmtHeM5Eaqg8Hgy4pxayqY0MeJlR7mOMeSVZlrV1O6V0
	mkvevg+g2EluRTYnQktr4kWJ6Rg8sH0rvRe8xpNhWTMan1Dn+cBfvEifUJGFm/sCQcL+HSrpSyG
	Tv3SWcwvE
X-Gm-Gg: AYBFou1uGzTkZktqxg4lE90ysyhW2Gd/y6WGpXeQAuP+vJyghLyosCxvXHs0iKS55QB
	bZhvSXLI4P2QW2+iRAVfpbzOkyNOGPi8u4GLM9EJpSppGhd+Y3pnk57NNUoMSnAGbnPpkilVk/g
	AIBwD1fgCld0ASPGR0H3A/RhQ4FyNNybEBwoo7jTSco1bTv3J+jEIJ+i7iMhV/nGs1AcrE5xoPi
	rmPJKK84TlgdqdvZ1lQeEq9NZmizQeFzJLZWehHAd8o+jNaj5vKyt6oEkQZwz3LE7wkVJKKOf6G
	RyvJ0ukkHbyVmczu2spQEcvC2I2O6TjGhWI4LuKQetu4A5oLiqnT1xBTXR87FBdxHXdOD+bWit5
	6z82eJHmqdqAU30EHelJhv73K+YQxgQw9SJxqvi4q1r+/cFrrqkpToK5zY+oE0OoLDWaoSHoXuS
	pG3MojifcizRU/IinxU3lbjo5CqEX4BcjSWJdUOwfOWKeDWFNDX6UiuFsQ0YjaqEkPLwmrVC1rc
	vmBP7uRYX7qQ0EG65aqJNjlig78NGUQodIwMmXALr3sawCNcIc2hNs+H3nMbG+yhlklf2qCl7uP
	YprZA1cwnXbaOp19tLV1JGQ17TaY7qrRFaARunIFDanvNqLS29OB9cX77rjgAyfektdnGwS7qJe
	+WdUcI4JSNDl619jT/CO54EJLPst0PSDnFMEcPw==
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2974708a91.37.1793417096261;
        Fri, 30 Oct 2026 20:24:56 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f99899sm2940976a91.2.2026.10.30.20.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:55 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: sashiko-reviews@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Sat, 31 Oct 2026 10:24:49 +0700
Message-ID: <20261031032449.3536559-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-191184@kernel.org>
References: <20261030151919.3511106-1-jjc@jclark.com> <sashiko-outbox-191184@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 15:41:34 +0000, sashiko-bot@kernel.org wrote:
> However, err_pre_probe only invokes udriver->disconnect(udev) and does not
> undo usb_generic_driver_probe(udev) or usb_autoresume_device(udev) the way
> usb_unbind_device() does:
[...]
> Similarly, on the -ENODEV fallback path where udev->use_generic_driver is set
> to 1 and usb_probe_device() returns -EPROBE_DEFER, won't leaving
> usb_generic_driver_probe(udev) and usb_autoresume_device(udev) in place cause
> the subsequent usb_generic_driver probe to call usb_generic_driver_probe() a
> second time and emit a duplicate USB_DEVICE_ADD notification without an
> intervening USB_DEVICE_REMOVE?

Both of Sashiko's points are correct, but both are pre-existing and this
patch does not change them.

Before the patch, a probe() failure returned straight after
usb_generic_driver_probe() had run, with neither the configuration nor
the runtime PM reference undone. That has been so since commit
c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver").
The -ENODEV fallback has re-run the generic probe under
usb_generic_driver since commit 88b7381a939d ("USB: Select better
matching USB drivers when available").

The patch deliberately handles a pre_probe() error other than
-EPROBE_DEFER exactly as it handles the same error from probe(), so that
the fallback keeps working. This is stated in the kerneldoc. The only
new code on the error path is the disconnect() call, which undoes what
pre_probe() set up. A complete unwind in usb_probe_device() would be a
separate change.

James
