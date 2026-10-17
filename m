Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82123CEB90
	for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236975; cv=none; b=svXAEL6eXeW11KjDeR+ZbjdfRrPcwtwKK6OLNNOn5vyt16I4z2tQvUV+3gALnp8AyzBAlNBPYca/Pq1ttQtORUdj7JHDbOOZgdMNRvAreq9As11VjxDrLihFLSGbYtfCIVkzQWzKfCclRtfq8PvTEnVJz28n3IGF2aes8sREKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236975; c=relaxed/simple;
	bh=yNAJuYmjmAjUWtFgm4yj7+VgRbs02dwrTOWE3O4Hxz0=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAUrXM5hY2F/IZiN7ar2C9H3of12lUsdkKi1ZaxWOFq+eu66V9EZhtVDKt3wnjbXanK6JYMEItfKvmni9+GQ8B9/ytv1x9H3wp8nwOEU8KoXrA4Kcb2RsYIkbetZpN7jK6N4J16whjOpvVP/uTVwZrp6FDMi0RKcaYaQJxSy1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fc+coPvR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fc+coPvR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4c78ee4d6so129200a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 17 Oct 2026 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236974; x=1792841774; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=Fc+coPvRpzZK6pIeLAW4jXIdQsgRvbRVuKkEB6J7tGE/6mW9BHYm7yhV9hKtcRdM2C
         EhMMiLdfhjXZPvYbz/dtDjULc3e3ZBp7x6Rtlq8zzrYzFJgw30TQFvCxGhhQe3gnguIG
         DUEdR2yxjd0tnV+OFN6oxSX2YXhjzASYi9CwHonRY5N8YXXvG2/uN4MUFmHmZkAB6Gng
         Xj5w9bf1q3OEU8RaHMxHjpHo8jLWojvMGZi0P7wmF5/Q3tFkxhDLgQVr+R+s5cTNasaO
         Aien2YfXDkvWDs5JdTlZL0xDlOCoumvA5x8ld6yd4/Z6ykTCww9BxWXVQxX2jaZ8zP3g
         ezOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236974; x=1792841774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=qfQBxKQtkiuWpGnWzanLzTXq+9rDfE9zWKGTgXKSXgpVA2OLlpohh0pKJfu2QTLgHd
         vvLaCdQZgp6qHGWsEkDEJvEh9j2mmOk0BnxQlA5Jvt6W78am7Qr/yO1EW0u90gCVtx/l
         0Hg6WnyEj1IXymLAC7WkRN1V275MzSey3bpzR5pSTQRFN+YkniRdZlO95EiA8d+exMFK
         C6T7HSkyBvWhIhv9DHbeTIA77pzxq95xYrXAkv2Gczxqo1TBh8XohRI3Rh6i2qHD5GPv
         IgFcjqehHhaW5Z2/fOMv+JLEYqOfnAm6/lDdLhqQ0wo3gS4aErQ1jrIGjeC8p86NlJmX
         MQVQ==
X-Gm-Message-State: AFq9FYIsrSLAdlQx4WaZ6fhaVriwWTp2mIaTZ3paKog0BVmC7T5S51Q9
	8cs6HC57Eg7pJX7uM9GON//yKYJ1NxD3C6iID612ZPNCAPagHOnUdpIvfv2t5JAyFr4=
X-Gm-Gg: AYBFou0fEajtsG9ZEybTBIFoMbjLHl1BwcwlOOsWpcK8PHaBqW9MOWa/BKdVEx8Yva/
	mF8v/ALueT2WjL3tEMgc1n40mdmljq4cdkDvAD//51eZxZYKkvA7P0CKMQaNDPTfKUcbnXrLwzj
	uLufqxDlm7IsODBGNNhVxmhEIKUiJcfTlz7QBttroVLE+JDmSwqMAkexaggodCnvipKzNFGxZzs
	KdW2y4OUuGf+lpAQ2d25Esn+BJUoUAxLJ4lWPbqXF+rTeAx5JvT81RlIYxzd7cOpSEyf+ph6hYX
	7RiOE4zmW/qGwKUrZS1ccRsrMOFf/Z2CDPf9/Ircm8Qe4I2mJrTlNi5gDqqWXoov4CrauzNlLC2
	BP1cXeJ+k2iPaZejCOckE0qYbsyYovbi/BdI4wqQW0fxE0OW1lBgcDpF7f6PZ/Zs1n/CGad5LG/
	2L3/m/likv8kVNCAnCxvAqppzlPhdChKAG4QkuPcTE/mrDBjoCxr00Wjbk+Uwm4Q4PEzoDlta2F
	HX4uxXtTbS4rj16PBxL4Q==
X-Received: by 2002:a17:90b:164b:b0:3aa:ff60:9bb8 with SMTP id 98e67ed59e1d1-3acef167affmr3313208a91.3.1792236973898;
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Received: from [10.64.8.87] ([61.171.228.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm12999321a91.14.2026.10.17.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Message-ID: <6ad35dad.70c60f76.2e7ac9.12a4@mx.google.com>
Date: Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Rao <raoxu@uniontech.com>
Subject:
 Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
In-Reply-To: <sashiko-outbox-175494@kernel.org>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com>
 <sashiko-outbox-175494@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> Does jumping to disable_slot here actually disable the newly enabled
> slot_id?

Yes, you're right, and thanks for catching it.  The disable_slot label
should pass the local slot_id.

This is a pre-existing bug, separate from the EP0 context accounting
leak fixed by this patch, and it has already been submitted:

  [PATCH] usb: xhci: disable the correct slot on alloc_dev failure
  https://patchew.org/linux/6C94F1F35FF16E76+20260806084909.2959131-1-raoxu@u=
niontech.com/
  Fixes: 3ffbba9511b4 ("USB: xhci: Allocate and address USB devices")

I deliberately kept this patch independent of that one.  The decrement
added here releases the endpoint context reservation made by this
invocation, regardless of which slot the current error path ends up
disabling.  Once Xu Rao's fix lands, the error path will disable the
correct slot and the two fixes compose cleanly.

If the maintainers prefer, I can resend this rebased on top of that fix
once it is applied, or send both as a series.
