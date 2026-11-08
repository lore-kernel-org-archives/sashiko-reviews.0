Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100046;
	b=n4m71g4qxV5u8YROQSQkFdo3HB5ZbHvJYIOHhE5Nyb8XvuO/AIZ6Ke5MfmGPabbkC8as
	 OQ7kpstFo13f9hmWAYJVpAxSILRpxUoULf/8+8f5y9Y9BX51AgpuatdrZEvcfUiLDf+LW
	 nwq4OMR4RZfrdxAa21oGYgAxVxthBktqpSKxK8eEg0lj7kvyxQBaYYtwsSsWbZ1yBEga+
	 IARb1pSedvWSttvDrOQNWEXiFAtWNmPW8wTaIcJrpV1YTcUGIE+ZcxEjuF1w3Tiw/pxCw
	 u+N19qcw9WbS6OmZiLj2o3DDP68i756E/MPQT9Hl2SjpBZ50DaElXLNPc89BjQRJ+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
	b=XylK5MgCaqGZREY4mjROpzhayOUdLsa4h5/nxdcnaBqJfrmXbaSbEOBBNeQrwYibHBWA
	 W+ejrLWM7nbvOa8m5oPEbKlli/uqiFgt13EwPB23RUmmnG6U84V8fxL827by9BVGBmfP8
	 jWPVbT+xesaNeIFuNO8Q1fmlzwHrcge7eWyf3iwKMcVc612SDjT0KYWUDxbEJ2Wj7SDbp
	 Mz4cbzM6jXDQ5A4ozwIkOsNHXpYf1Y03w4G6DSPO4i5ZBx5rKLKQdh1yINQvhMgx2dA14
	 A58sEv3sebcR/X5eoCbYQ4g6HsOXn3qXXKrdgIRLza52Ud0yr5h4k57pCgvXNGiIo5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wkme/hoU";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE34606A331
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 01:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE34606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wkme/hoU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso347833eec.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794100045; x=1794704845; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=wkme/hoU2GZIILXIJebxygOznpQ3HnWkUoZAS4EDjqmKH8zgFz+WolNvxMhmvlGW0S
         dkm7aoydoo9Tvrnb2COza8i2qMBsRZijPouGcbmh9uU/f5wkHo/OKG1TIq4ceb/kERbi
         FDhXhrTKFkMm1FcVVUA7LQn2+aHl+XXfK7d9SnN6k7BDdzIvJp+sOBlyWtTjOPK+EhS7
         /nO4UHiqnKTmbq0z43kvd9IAJmNCtE5cpozxcZ9uB6IrpCXW+P+CBmAb9oFeFvoPorvt
         XoJCcmNo1Wr3Xf1nFcJTYQqvIqcPq2Jn3O1YX04mk3dLHKKc9n9vPFC7VhOrA8aRRWWk
         Iqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794100045; x=1794704845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6NBC44oLa95X1aY0aLFRnK9SzAu0klmdILnt2Ypptw=;
        b=tBUR3velRa1cIy2zf8YhPdSc4bUV9hi2Px9oQkhAh1JTm3D1irohZNYQmeEdObDUEl
         NDPiL6xGhGzEF6ftAwOx2HWmzf9U4q/DbH3FKJYpFjJ3gr7jqCbtbN96aIxMZEsA+REN
         YDpmbkIzqP7G5Ra+FjM+Qtyl2u9XzOtydC0rITYeSwlcDfywN2g0hNl5kHA8FdIQ7jy3
         0LWXFLBmvsYUqvHB2hpHdGjEeFft8SWlUdp2x/J3JzjAW88ZfKOXAEVioFCgUlXH2tBy
         SL5WrZN2RcEBDlAyjCdhU3GfKook1aRBISCsokZoU6rt62PBRaeAO8vnqzVWeuGcK5f8
         GqEQ==
X-Gm-Message-State: APuU4Z/jt7rWJwYPPlYwRxxkikpSA/xYdLbq1LHJuD1pE6jHf7O8QmhZ
	i9HlrcT2l3uTAhxuudFQzNTP/59e5AtP7MPiY/czpuWeKKvR9+UIGJia
X-Gm-Gg: AYBFou37S+O1QEf7IEHyTKLt4XWMdY/BLT6ewSvMvhD/ftOTxwRIsL4E1nkKNX4dIiU
	ODxXo++65fkeS8zCVRGOt2sQhIzyzU7ZMZecrFjyKn3R1SMr5odWAHtPTkVZ98RJJgMZpYqvvMZ
	trunX9bTIdBxiH+gdcS+aeDZd6HWyXtS5aE1ImVA+m5804STTcfWIL9UN1bYOgl9gqCdA5NU9b9
	M9vSo++xjys+PH64PpkcoLkY+42Nk91HUhrE/Ipb08Hvg5PBp4XNwDc8xjCG5BFKjv8c5eu6vZS
	RuWj2j0bdaKF84EXHhxwHDaA5BbOqwDfCtUwaYiQBUkb93LLwGJs8Dg1h2e6FLMFQfvqxMO6GtN
	zGqayAjQjdEt2E2nRwGZWtPPKHsmaFfpE5wzqLlhYdmwBDrQXDPyE2/mVHasz26v0XZh9y+hakh
	3+w503d21UBRn05Pjku/qmmBYrCzTat08oLOr7USFRIEaYHIarjq3pC7mHyNJLCkjmDh1Si78e/
	Ae/cB1g8+EuTLqHr8ztNjsPnXp3YrJaqZ39hlwCY4oR3si/xpheL9stLqhiJd9ePCmVvb3jiMao
	34DiS0veS3blqYMq9zN0uGaAr8isiY4nHurU/v2pCu/U
X-Received: by 2002:a05:7300:e920:b0:36d:25e:1961 with SMTP id 5a478bee46e88-3725e240abfmr839498eec.22.1794100044508;
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm1344623eec.14.2026.11.07.17.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:07:24 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 32/35] drm/msm/dp: mark the SST connector disconnected when MST is enabled
Date: Sun,  8 Nov 2026 10:07:24 +0900
Message-ID: <20261108010724.4061-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929045429.A51801F00893@smtp.kernel.org>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com> <20260929-msm-dp-mst-v7-32-4b81473185e7@oss.qualcomm.com> <20260929045429.A51801F00893@smtp.kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 04:54:29 +0000, sashiko-bot@kernel.org wrote:
> Does this introduce an AB-BA deadlock between mode_config.mutex and
> plugged_lock?

Yes, I hit it on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) when
booting with an MST monitor on the USB-C port (Linux v7.3 with Dmitry's
"drm: handle IRQ_HPD events correctly" v8 [1] and this series). The
lock order is the same in v7 as posted; nothing in my tree changes it.
The HPD worker holds plugged_lock and waits for mode_config.mutex
(msm_dp_display_mst_enable() is inlined into
msm_dp_display_process_hpd_high()), and the compositor's GETCONNECTOR
holds mode_config.mutex and waits for plugged_lock:

 INFO: task kworker/0:0:9 is blocked on a mutex likely owned by task <compositor>:2439.
 INFO: task <compositor>:2439 is blocked on a mutex likely owned by task kworker/0:0:9.

 Workqueue: events_freezable pmic_glink_altmode_worker
  mutex_lock+0x30/0x70
  msm_dp_display_process_hpd_high+0x23c/0x2c8
  msm_dp_hpd_plug_handle+0xf4/0x208
  msm_dp_bridge_hpd_notify+0x118/0x290
  drm_bridge_connector_hpd_notify+0x7c/0xf0
  drm_bridge_connector_handle_hpd+0x5c/0xc0
  drm_bridge_connector_hpd_cb+0x1c/0x30
  drm_bridge_hpd_notify_extra+0x4c/0x70
  drm_aux_hpd_bridge_notify_extra+0x4c/0x70
  pmic_glink_altmode_worker+0x274/0x520

 <compositor>:
  mutex_lock+0x30/0x70
  msm_dp_bridge_detect+0x54/0x338
  drm_bridge_connector_detect+0x40/0xc8
  drm_helper_probe_single_connector_modes+0x158/0x608
  drm_mode_getconnector+0x19c/0x448

32/35 is there to avoid a transient connected -> disconnected change
seen by polling. With 25/35, drm_bridge_connector_handle_hpd() stores
the result of detect() in connector->status right after hpd_notify()
returns, and detect() returns disconnected once mst_active is set
(29/35), so I wonder whether the write is still needed. If it is, it
could be done without holding plugged_lock.

To get past the deadlock I dropped 32/35 locally. Since then, booting
with the monitor attached has not hung (4 boots), and over 3 plugs of
the monitor with drm.debug=0x4 the SST connector never showed a status
change in the probe helper; it stays disconnected while MST is active.

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

Thanks,
Joonhoe Kim
