Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D02E51812D
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907003; cv=none; b=ltiMksy3mevI7f2a5yxNCcyRWjjTKvv9UEZ7VJE/amzzKRqTDgO8gbLephtIFoTG11VtN5yiAxGGSoCOOHsIkfnhl7m/0g+jiuQLeB2wO6vPmdQXwrU/YzUktrCXS6wsX0jxBnfTbMKpqJzLXddTR6HBuyQvfHkQrByNhpad9TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907003; c=relaxed/simple;
	bh=PJ9dXQMUMVdeo2eky9bZGiFj3ql4//7/QV8kLKg5ezs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=g6T3lt16VlW6jOLzU52WrAqjCBwMKXoCxUkktYd33+arKosI8DHjlKc6pA3rene7UjeNZu5Uou8wX67yxZfURiyijVS6s4op8+/d/J6qRcDkNBko3bOa6Ii4LQYXiwSL6py1CofkwrKaC2Ngz7HrbKf1f85X47YOCjiurZyTKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SR51IdX+; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SR51IdX+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 181871A1214;
	Tue, 13 Oct 2026 15:56:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D32E260362;
	Tue, 13 Oct 2026 15:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33C6C11D717F3;
	Tue, 13 Oct 2026 17:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791906994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=354zwLB4JSBzC6TqObl0kjMSQwxU/dQftIBcAR5WAQs=;
	b=SR51IdX+cqmSpy3ZmcfhTl/74buqACNKiOJK198dtlEBesTTLuXjG9o58dHpHqnBGPvkfm
	eGWOh3LMmAY6smt4dhYTbcMtALArKqPWOH8c/zl3wZzHsip9rXzCZtPeWIm7icU8a8vquN
	90ZVVtgKn2vrn1P+gLHiSKsXcljOhNgBrc5PVtUlkCp8JesuFbnwGOcrjkbOLZyJBUGe2y
	coPQtg34PjcJvyrlR8l81++Wgc6aT+1bjQs2TE/HiG1r2bhOj/Wv6t1oTCqnU8v4Od6lxb
	MnZiHT/O4KZ29UGlNM/gZNzrIo7n/2etAh1fGT+jaAjexb4XhyFTPsJJcrXvyQ==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 17:56:32 +0200
Message-Id: <DM3U0JWSFAS4.2J8MSWTKYBDBN@bootlin.com>
Subject: Re: [PATCH v3 2/3] drm/vc4: dsi: stop using deprecated
 drmm_of_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>
To: <sashiko-reviews@lists.linux.dev>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com> <20261013-drm-fix-of_get_bridge-build-regression-v3-2-0b4c0b65be82@bootlin.com> <sashiko-outbox-170020@kernel.org>
In-Reply-To: <sashiko-outbox-170020@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 13, 2026 at 5:35 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] drm/vc4: reference leak of next_bridge on component unbind/reb=
ind
> --
>
> commit 01a94378aeae8cb42a9f68ed6384a34ccaa162a0
> Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
>
> drmm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>
>> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi=
.c
>> index 0148f2befed14..675bd0fc13913 100644
>> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> [ ... ]
>> @@ -1775,9 +1774,13 @@ static int vc4_dsi_bind(struct device *dev, struc=
t device *master, void *data)
>>  	if (ret)
>>  		return ret;
>>
>> +	dsi->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +
>
> [Severity: Medium]
> Does this code introduce a regression that leaks the bridge reference acr=
oss
> component unbind/rebind cycles?
>
> During component unbind, vc4_dsi_release_action() only drops the referenc=
e
> to dsi->bridge acquired during bind:
>
> static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
> {
> 	struct vc4_dsi *dsi =3D ptr;
>
> 	drm_bridge_put(&dsi->bridge);
> }
>
> Because dsi->bridge outlives the component unbind, __drm_bridge_free() is
> not executed, and the reference to next_bridge is not automatically relea=
sed.
>
> When the component is subsequently rebound, vc4_dsi_bind() overwrites
> dsi->bridge.next_bridge here without freeing the previous pointer,
> permanently leaking the bridge reference. Does next_bridge need to be
> explicitly cleared in the teardown path?

Ah, right. I'm fixing this in v4 by calling
drm_bridge_clear_and_put(&dsi->bridge.next_bridge).

Not sure adding it to vc4_dsi_release_action() would be correct in case of
unbind/rebind, so I'm probably adding a new vc4_dsi_unbind() for that.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
