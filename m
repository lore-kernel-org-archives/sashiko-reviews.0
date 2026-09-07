Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5030675F
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775428; cv=none; b=YY4dgeymSrxzaxe40H/OGwjDUHaR9yF6NXqEF0Hozkufla3dRxR2XhEyT7JQPHldy95/eSgauKDVRHpW7eQ/QqJJGH0wzAnSA/vdYzUXmKlDcUj8l1xumpYsG//jX17UKfitYDJUwVjpgQISDihXb7QNWdhHnFJYx4NzQITGMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775428; c=relaxed/simple;
	bh=taXTc8t7jL99ksLm+NqxwaqOr7jS9mZBmvjMDJCVE4g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAm7GpPmLX9BsnhBuOAyLdBZWt9Vz0ob91o7ylIu/ySjGBRoroPD/iqj72U+fiV2PqgPUcplfodlqFNedMNZGQKo7UPX9s7kqEsjH/o5QQrQ+qOHxIsUY9n8JTfzvfLFGhagu+LjOMOxNe8TAcN7CLuPBG5oaavyADaRfGckClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxR7JBaz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxR7JBaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788775426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kFIjBLwrnQNzpzBiLrwLCrhQmY54y00GCWAvNQxRSQs=;
	b=fxR7JBazs95yUALhjX6jg+Y53eYy/bEIByNgVjqSmvBfhIhGIRCc1Ci9nUuKWYFKFMMkqD
	tSPpppNNF23NY5W36bQ68KiIxHP5HbDpuT8Zf46YPPpzoH12H1BwUeZe5olNVtHtK+ZM8a
	lpS0mtWe9BlP/maLA6OB/SAgVxLihnc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-GrJDVsTHM1uyzZnN8fGXZw-1; Mon, 07 Sep 2026 06:03:44 -0400
X-MC-Unique: GrJDVsTHM1uyzZnN8fGXZw-1
X-Mimecast-MFC-AGG-ID: GrJDVsTHM1uyzZnN8fGXZw_1788775424
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c217f249fa1so321416866b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 03:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775423; x=1789380223;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFIjBLwrnQNzpzBiLrwLCrhQmY54y00GCWAvNQxRSQs=;
        b=p+rYIuVHopKIPaHFysqQ5FjmANcduuTTPag4DpnK+CA4A0hwpD71AOVzS/DV702IQq
         qz1pTII0gvvSXiJipYDRwho3JfLqVGAI4jAsEfrBMHFZMA6ttigdIlPaDhTjLjZ7zx8g
         Sx4hYitHmQ/16DneBjDAxUHD7iunrdoJR+NU88TTnvG2l+o5ncvqJMPRlTFC/CC2ZhpW
         oTBafxM3IMgK2pQqLpdkaXqRjyV+UCgbIzO9LpRhXg+XtJIStT/JSaw6xGYCEAOOYsFO
         louIE6a4UwDgvj6kETJ/4HkomjltoWxb06QYp4LlNH62GqpkOCx1nLF7z63WImmuOjKl
         cdSw==
X-Gm-Message-State: AFuF++lt4+Jo+q4NhN2jjJjknz8Z07qFJrOfjA5wZrfQ1q3Y/0rTeQcl
	+UcNlntPZIDOJyqAj0+y1s8Y8gV4Bb1WOWWXpH8GJthEtyhnqb/V1G98Ul/nWpxq4PV3QCXxSYM
	DeKnPaK3lLTF3mlsKp/DMpMIgYfCYx5Nljl9Vprays+6f0kgMncX9X19t+LWmqgcbqK9r5gqVuW
	8sshNgk6a19c+mUOyYjBCRfwvD4ckY+0YTixd3Q/alp0CzVgg=
X-Gm-Gg: AYBFou1CRhDjb1IuxvstviwCpoclt4Oktp2qmkG7EhRXqvZmWbaOKIxLnTMHhHsGmd9
	DF8Vp/0U1NoBH79hlxfgPXlD85u2wDqOrUsccHnITJxJiYhF8/Vc26Vvopv7Zio4HRKqfLAg48s
	u/qIlm1Mpfztf4BKGA+OoAKb+uxGUiGgp2mZBJIkXxzdHHFLH2HzBhdkhpAuiRJCz6FL8UasYh4
	oWhsafK8/VY6L/tZIlx48HT6/uhs7MCL+ak2YmTTpCJVCqLU5e+EEpcTUXf8+whsD4MqdKauGMb
	zYp/V34HMEmQvhjRZXCxJcXV0UB7/a95nA4DkjrCfSkFLNa8uqoXo1vprtWpQKwzAQbU88+FaX/
	xDWVMfL1Zu2y3Iyba6ylXTFM=
X-Received: by 2002:a17:907:3c92:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c260c65c118mr914662666b.4.1788775423550;
        Mon, 07 Sep 2026 03:03:43 -0700 (PDT)
X-Received: by 2002:a17:907:3c92:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c260c65c118mr914659566b.4.1788775422856;
        Mon, 07 Sep 2026 03:03:42 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm450449166b.46.2026.09.07.03.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:03:42 -0700 (PDT)
Date: Mon, 7 Sep 2026 06:03:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, Chris Mason <clm@fb.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	virtualization@lists.linux-foundation.org, ksummit@lists.linux.dev
Subject: How is sashiko bot deciding whom to Cc?
Message-ID: <20260907055646-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 2
X-Mimecast-MFC-PROC-ID: Q4F_WefGDnTPlaPKCW1ngjYNR-_OXR43taJOvcdbWbc_1788775424
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

There doesn't seem to be a Sashiko list, so I added ksummit as the most
likely one to catch attention. 

If you run b4 mbox  20260905153514.B55561F00A3A@smtp.kernel.org 
you will observe:

From: Karl Mehltretter <kmehltretter@gmail.com>
Date: Sat,  5 Sep 2026 17:20:59 +0200
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio Pérez <eperezma@redhat.com>, Dmitry
        Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, Pawel Moll <pawel.moll@arm.com>, Cornelia Huck
        <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>,
        Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>, virtualization@lists.linux.dev, linux-input@vger.kernel.org,
        linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] virtio: implement synchronize_cbs for remaining transports
Message-Id: <20260905152059.89560-4-kmehltretter@gmail.com>
In-Reply-To: <20260905152059.89560-1-kmehltretter@gmail.com>

with this diffstat:
---
 arch/um/drivers/virtio_uml.c             | 10 ++++++++++
 drivers/platform/mellanox/mlxbf-tmfifo.c | 14 ++++++++++++++
 drivers/remoteproc/remoteproc_core.c     | 10 ++++++++++
 drivers/remoteproc/remoteproc_virtio.c   | 20 +++++++++++++++++---
 drivers/virtio/virtio_vdpa.c             | 21 ++++++++++++++++++++-
 include/linux/remoteproc.h               |  3 +++



the sashiko bot replied to it:

From: sashiko-bot@kernel.org
Date: Sat, 05 Sep 2026 15:35:14 +0000
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, Vasily Gorbik
        <gor@linux.ibm.com>
Reply-To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 3/3] virtio: implement synchronize_cbs for remaining transports
In-Reply-To: <20260905152059.89560-4-kmehltretter@gmail.com>
Message-Id: <20260905153514.B55561F00A3A@smtp.kernel.org>


So it picked some mailing lists but not others, and some specific people.

Is that opt-in somehow? I'll be happy to get Cc'd on the auto-review email.

-- 
James

