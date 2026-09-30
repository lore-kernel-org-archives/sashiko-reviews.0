Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3A47ACCE
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 22:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808604; cv=none; b=WEN3+Pxxa5rghhBGQjbKEGRMNFfyKSdIQuqr24WSYgtw7nMyWZAFskal2imXDXDYCQdYXb1Il8A7x8mvbyjqQoN5tnVXa4L2Hdugj+zqrUs2xO46KoOfCOaBC+ee1X3qxY6iGv4kA47msM176BOBahiuEhKvK8PzeK+Iyzf/sv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808604; c=relaxed/simple;
	bh=WizLIhM6TlbVNKCi1noWPXGUULrd9AFMwA2m8n/wriE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwcAMx69+9LTLZN9oh6wNJB2fn7yWByJvHQa9kpcTr2YizjePJYPDnKqKQSOwKfJgw58gGpVnCbT7uE9vPblAtKiGCtFzMIjbnxvG5L1/eo+jU++qhwEv6wNtQbjEboaI7JStXpC2dFU56gPWGwiS5co7GffrO63fYFgrJJXosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJkAouHa; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJkAouHa"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so43388385e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808600; x=1791413400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MajK9XnMSU/e1T6MRJFZkvlCwouooPRliaUc8H8wySg=;
        b=EJkAouHa3c8E0YLfQu3C9lo2vP5PyfabskREG6s6o5dPjOzAAqXvRCjT59hd6MUD6E
         v+x/aOYT7IV6iJnvqXneQRPDeN8xcNmufwI0ZCZapRO49xgmv7uqImQd4NZaMa8sDToK
         h1ShqOCuzqoMY/OaLimfjLDFPt5k4bX9t97h/qG++7bSjjos+q21qP04oNTZZpPxO5V+
         W9MJCZcpwz5sHWcrnM+nSOQ+xNVCF64ricb/m3ON06twkZvNSARdIOmW+cDzN4oBTYOZ
         Iio8O6cYik6c/pfskZVG+ASSgFZ3yIdX8ZboOiWdjEPAfqEM/VsQ+GxNrx0WgOAGHONY
         ocYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808600; x=1791413400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MajK9XnMSU/e1T6MRJFZkvlCwouooPRliaUc8H8wySg=;
        b=FNUywMg4AprPbMwA/1ttEKiWmEu7WTfBhX4vr+n8hNC7K0zLDAkaLA0qhqP3F3hAgr
         Wd1JkXWDo2p93zyreKY1JWbOWzwvBrBfn9LOFAO9CT+pYPbpJEudktchoMV87QoIHsQV
         CvLdxS/C1vqUqVskVeMCHFWitQzJ+R6aJ+9t5WnvpqZYl1bqMbSO5Ub0IMk+CMCIUk+Q
         F1SiNmuRjWIJ3yNWHr9vsmdmMwHhqiZnZe9p0hhH3ZmWqHalzlBlvv+O/NaMS2Ohrx0Y
         bbElSVFAzpU8HUBayQKqR25f1Ist/rx1kBrqe5VuI8oYKYBDdFIdPXXtoNoKLHxo+r+f
         DAZg==
X-Gm-Message-State: AFuF++nDF4K1iOFaiOm9t7uFT3IvmsX+OP+ILIrwkV91UFZd8HdRyXTF
	GNqpto1yguCZ6AeX6LTas8O7fXe36Jos8FKsEKSTcBTQIpvEqF5uT5XDRcdXG8EwJS+5ahzm
X-Gm-Gg: AYBFou3b0YiKwnAjM8KYyLHedlBGn6zx7aB1Sr9ZES8NPnMmj2HslEoGn6vETzX6028
	KNytU0alvrkfdsfgPPP6D1YSJf0gVkMeVjeqWOrwPj21srabFOfmsmyrYU5/dQG4IQOK1/rLHwt
	LNK5NkX7LmHeYV5b1x9C3o75ihNl5Nggg6LiTx3bNrG+cxTJNqBwT0mKAr0FpfHizazOZZ5ZiWi
	J3ZFiCakfFFQKV8jj9SOhzKibhc+QymItQDunxNgByeKRu2JWsJHXBAt4RSxNy1zgabskY9224A
	9WKI6X3WBpiXY450MsUpsM+QOP+NyBzdL0H3GejJDuMx42nXtymEJlwTHghyqhZu3GQpEpzndT5
	S35gFRAFkggy7YvsEQ3B6VHOurML8VbDlSYlQD++kMzdgKSuOeIb//6lwKsRC3Zb0PLsV0oh28Z
	DAzlrcglGl7Ipjx8pI6atu/UEDuYF9Jy/ZgbxVD28obbTdUtH/3Wj1B+kz6tS251YMBZa/A2FKQ
	uzz2EUiqAekAeI/jk5mcFTef+9q/GNc7+eq0Z3H+7W5XtPuzGqgp6Z0k6uDZbVnGtoGz8A=
X-Received: by 2002:a05:600c:8b33:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a020c77b5bmr1641235e9.0.1790808599991;
        Wed, 30 Sep 2026 15:49:59 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f922ac4sm16411015e9.6.2026.09.30.15.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:49:59 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH v7 2/2] ALSA: usb-audio: bind the Topping M62's vendor controls
Date: Thu,  1 Oct 2026 03:49:54 +0500
Message-ID: <20260930224954.121402-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930215023.39C5A1F00898@smtp.kernel.org>
References: <20260930215023.39C5A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 21:50:22 +0000, sashiko-bot@kernel.org wrote:
> Does this lockless teardown open a time-of-check to time-of-use race
> window before the tm context is freed by devres?

No. The two paths are serialized by the usb_device lock, and on the
M62 the path does not exist.

The failed probe runs with the device locked. usb_bus_type sets
need_parent_lock, so the driver core takes the parent's lock around an
interface probe (__driver_attach(), device_driver_attach()), and at
enumeration the interfaces are added by usb_set_configuration(), whose
caller must own the device lock. really_probe() unwinds a failed probe
with device_unbind_cleanup() inside that region, so
topping_master_teardown() runs with the usb_device locked.

The disconnect does too. usb_audio_disconnect() runs from
usb_disconnect(), which holds usb_lock_device() across
usb_disable_device(), or from an unbind through device_driver_detach(),
which takes the same lock. A later snd_usb_mixer_free() finds
mixer->disconnected set and returns before private_free.

So cpu1 and cpu2 in the sequence above cannot overlap.

As for the premise: on the M62 only the AudioControl interface goes
through usb_audio_probe(); the streaming interfaces are claimed from
its probe. If that probe fails, chip->num_interfaces is still 0 and
usb_audio_probe() frees the card itself, which runs
topping_private_free() before the driver core unwinds devres.

-- 
Thanks,
Mikhail.
