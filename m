Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516C3B9DAE
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095032; cv=none; b=aOnqYD1WIRCaSjqBsS1Sk6Qbv8W/QzNBrbHqrDrJf60FK2E92zpeLptq4dng8bkHFKwV1Gjy6jXAN8r6W5ucqttqfYRwney020jOjc0UomoRBGCCuBHsMFyDgJiKdgwO4wYoxFJbdwXKbVMWQHLm9sxsoy8cMeT6oFKsudDtTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095032; c=relaxed/simple;
	bh=w8TATEoB6pxgJRrivcnib5fz34jW0UieP1XhmcHAs+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPT04ENPmTPoTLsojSUmkNZig0i8JQDYeyWqEgwbsoly9eZzZsgDvPSfMeFlKYqisD3Yzg0bjCcvBD9CZyZc+eF2V3uTaluqLE4sZ1g4fI9MFrVbLucNZ7FXHoZcBfjQ9QyeAWvkxJqLzOVRytNusM9mOEZeqISpmkyzRP4PQMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyLdpMkP; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyLdpMkP"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1339013a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784095025; x=1784699825; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9/qISsdQUme5GsgRDDsX/+bi7zmIEF/ab3Tsuj6Oco=;
        b=UyLdpMkPvwlLydjEa/Lit5VHwSRrjoscnKyOuaKgUvYb5rNyswwumETfRf9JODEiO4
         KkuUjMd3BI6Owl4MHFq4J3CKgGKb9qg9dFv4ak7tIzEkXE7GssSG/OOLwIsACWcDymYR
         4QTR/ROZhp3Vzh6bzAyab1FQ5LeuU4g0nbTYoanwqHk6LUt30/kXp0mpgD5Vz8m3TNOC
         Awt7sR7gVX9XvcR1ubau4iLNSO+X+m/Hzfj68HWqZbLbLp026BRBjZY1XXMD91S9Y/FR
         BlyUgu9A7wOwxfDzHSR5a+N51RZpQ3brVeP1INn7cvfZhYrmmOFum5djKFE6nCfCHdee
         vmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095025; x=1784699825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z9/qISsdQUme5GsgRDDsX/+bi7zmIEF/ab3Tsuj6Oco=;
        b=oy6vazZjF3hBsJwzVcf+zy0XMrEmNzRcy78xZoA3CaEwE0GiPbmhTT1xwXm/h4B3ff
         /6WBt8dQvln6PVvIhtgDO/3JAeH3/mRO9xLGCRt77tkoz5vYxDHNast20KavX0gGOb4E
         2fdVkpmxfx0sCCFTvz2QzhMaFlXDnMkIo/sPncJY/oNSJxf3Z3SdG25lBACrp9gFNKvy
         NQdWJ/V25vO4QXqQWMPnPMbm9MxoQLEI9iMlGc6A8nsF8gXDjwbGrqjABUVo2lRSH1MK
         5TXKTC5uKtdzTbJ9p018JpxdiEQg5A1Yj5HwOpNXr9sMNeqvoAHpRyNe98oVXGTZJE+s
         bZgQ==
X-Gm-Message-State: AOJu0YzuIIh4jOX1H3Qv7HtmxCJfNvvK6U+wsTVmT8HzSXkIQ0ktkgdt
	R1YoIgWflpJN0J/QgrP+0CFlkOCbCb7oAD66ksimfnlOpAk/KOEAgGEq
X-Gm-Gg: AfdE7clmTSN0rnleu3/wfI/ik4I80JqsegQ2n09gqpeQ8FbEz38FfggeG3PJ4HcJlvO
	QMmPfgE45cMx0C0DRMg1AbNqiKUNFRMBW1akCo79WGq046DeS4Jb1i2bjw0Rh9DaWmkIcuA0/E0
	JvupNZmulLN3+UNAr+/8PqXqrVd5VQpowp4CDfUnOijwqc/I360pqCpWnf1havCE6GBQr01xwXI
	o2uh7pV54LpLO0cksvqUnG7K7DOPZNw8CqqF+XeT0l6a3EGzVDEXBMI0BQH6VZemGFND5m+pjMU
	7rUBLRZUfUAjR4ygLPvQX5r65qdqK9umdXp8u6IeVDQ5Gy+WGrTqUV9xzZj7z134XV++nU6QYJo
	9M2hwaMQrdQvuUpvxd5/BVVmcCPwkCRp8dEQIo2xl1wZ3caZgIrzQ6qyDj86gxO0NlzGo3MkAiV
	XmT2qFGQMcgul+kNw9zRORwS9x6SdlxSybl2bY2DVhIUWWUs/mTKA=
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr14377317a91.5.1784095024738;
        Tue, 14 Jul 2026 22:57:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:93:a597:7931:c950])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f81f17eesm10617514eec.31.2026.07.14.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:57:04 -0700 (PDT)
Date: Tue, 14 Jul 2026 22:57:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: chlgustn3171 <chlgustn3171@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: input: allocate input_dev name/phys/uniq using hid
 device devres
Message-ID: <alcCgHzV730RKPmR@google.com>
References: <20260714120052.255085-1-chlgustn3171@gmail.com>
 <20260714121819.5FCC91F00A3A@smtp.kernel.org>
 <CAO2ma08Pap6PZKUV7iEpvu11zaKrzMK-cgBLBYKJEEfGH+0=1g@mail.gmail.com>
 <CAO2ma095Hu1kOTMds9yHqTvwde8Gu+GWOLUst5U2eCnSffkm=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO2ma095Hu1kOTMds9yHqTvwde8Gu+GWOLUst5U2eCnSffkm=g@mail.gmail.com>

Hi,

On Tue, Jul 14, 2026 at 10:39:09PM +0900, chlgustn3171 wrote:
> Adding maintainers and mailing list to CC. Sorry for the omission.
> 
> On Tue, Jul 14, 2026 at 10:33 PM chlgustn3171 <chlgustn3171@gmail.com> wrote:
> >
> > On Tue, Jul 14, 2026 at 9:18 PM sashiko-bot wrote:
> > > [Severity: High]
> > > If a userspace process holds an open file descriptor for the evdev node
> > > (/dev/input/eventX), the input_dev will outlive the parent hid->dev.
> > > When the HID device is unbound, devres will free these strings.
> > >
> > > Can this cause a use-after-free when userspace later queries the
> > > name, phys, or uniq strings via ioctl (e.g., EVIOCGNAME)?
> >
> > Thanks for the review.
> >
> > Using &hid->dev here is intentional.
> > Using the input device for devm-managed input_dev strings is
> > problematic; see CVE-2023-53454, where the allocation was moved to the
> > HID device because the input device unregister path may still use the
> > name for uevents.

Thank you for the patch. However, I do not believe it fixes anything, as
moving to devres will not extend (and may even shorten) life time of
name, phys and uniq. Normally they are character array members of HID
device, and HID device continues existing past drivers disconnecting
from it. OTOH devres-controlled resources will get freed when driver
unbinds from a device.

Additionally, HID devices are parents of input devices, and should stick
around because input devices hold references to their parents until
device_del() is called in input_unregister_device(). However before that
it will disconnect this input device from all the handlers, including
evdev, evdev will mark the device as !exist and evdev ioctl will not
attempt to process ioctls for such device.

I however am not sure why we see this syzkaller report. Maybe there is
memory corruption somewhere or maybe syzkaller itself gets confused when
tracing numerous allocations.

Thanks.

-- 
Dmitry
