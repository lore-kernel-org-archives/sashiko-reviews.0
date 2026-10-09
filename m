Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445633DDAE0
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523273; cv=pass; b=kGth98/CNbGhY9PDZtcvoLLXVewxQTEJofARepP02FyRrvc0NdLXS/G7yz1VwinpgZGa/SWhCnnd2dlhi2ZjEBIhW75/7dGAxeYaDWLFZDAPoHJEhU8P+gX5NRPqiRf2uSKhY2JE7i6Rpys7AXrTCg321KpL1zCgNjpmvAHVe9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523273; c=relaxed/simple;
	bh=Stb/CwH5dz2x9JkQRPEB2Gqhr3MjteQSh8JHCWdSHY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBaYFw0hvnLrkMiNwkvalwmkoUE/XP042b1lUUdmF+6CAey+x5AdSVf/Vb5nWAapB1D1/S2lTVx26hiaYtEHbQ2dEZ9LTWYwPimJIkRJ9XLcpcQ+a8/Xgvt+mPEKDOaaIW5k68ZJBEG7MXjzZKUz3c7eGFrEbaGPVHnfIFlJAC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzD5veVK; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzD5veVK"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac8a2ac52bso14934437b3.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 22:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791523271; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/jO1bbp6hhzzH2Heg2marPY6f8Go92rMj+Qtx4b3BCyDww2z8jBMPE9xlUx2B7iRP
         2ipRBL/LEw+yunrqHowJS2aXGlGF2tIhY3CcVOeIz5kwXmrP/42tpiYTwD3LwxqY0JCD
         LmPrAkI3fYd9cxdiTmgaqsy/ivG/jv8OkAn9C/NykWLyZQ+0QQTQswbGqB9KjNkvpmiL
         /0B3rLh5BHbyr3wJZIg/BH8BmX3aYlIwTbfBA+ciL1tohbbpF4s20YWBulbjPh9G3lYD
         UThcntapCXQ3pftoDwiSmEiXqoEVPG0cLnF3NKeE8fcQ4rJd3I5sQrTZqReXAMbuhCRT
         Omzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=852odP3csbx4LeSuXbwMzl1y7NAMBr9FUIKGeegNeVo=;
        fh=OrnvA1a4t3/HPwWwQh2a6uxugalKSabxDHPY5ooI2bY=;
        b=pos8RhVe5fUkl4iVf6Zfig5KtfTQfPfpTBoED5Q7ZWv+R1XvwCA6aNwT1pmjpOfZkL
         CRAtrlr8lTB489QQfj32CuFuDGfz8EpGZ4FjshmO67P7o/n+jJNmaXZRGz2VmnNjbkR3
         9ivJ4Xdo69SF+/bfRWX2Z7V63ZsQrKEQR+i9istUeqeJ+hh2j3Vm4MRJ3ZWGwvFaghXV
         mOlGc7z+CotOXrqzkUkjz/kOPYjG/W/uZsp3gYcqyCRDk/AHUD9VNZSuXDANJs70p9G1
         8iuMIptncGmaP+wAPhvTiGaDWltuBQ2FBH/FgZvHbmpl4ENzMexSDQG/MlsKoLKx7SSY
         zsaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791523271; x=1792128071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=852odP3csbx4LeSuXbwMzl1y7NAMBr9FUIKGeegNeVo=;
        b=NzD5veVKwvCIMbwQPB/WJW98+HhFt8XwGv1+jMK+t2ElDHMZMpGEINzvC6hZXKXmxV
         dVTc30uwjRUN4qFxv/ApwauhLX5d6IoicgBfqzlSSwNw7VoG1HOKLUd9tEx9DaP9XRaw
         19Xph+M/WtG8+ViYGmVox96qN0HbO9MfLfxWg0HfV6zyJxSQbHivM9I2aTYVkq9Ko65F
         oVdY8XSPHrqe+a1Jjp6cvHdTwi9ULcckIsyC9VOgV2s34l5g4frzTLvWl4dTr0Wy1Qre
         TYvF+2iISvd1PWoi/etTRlbCDdFXw5xoLIYnv2J9rcZP6hlo3faUa7lKOOj4YamAErPk
         UiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791523271; x=1792128071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=852odP3csbx4LeSuXbwMzl1y7NAMBr9FUIKGeegNeVo=;
        b=LrtT/xEFUfA/FCk4fT7ItuKPjIbjcp7rAbTgxBprZZR+yrGwBYaDL+0nKv2BTnPc0R
         lID3e0Pst324CfQ3TSECOHU4UHbtjiqEtF4V4OjRpdB4CNccn9qED+XzI2JqjK/D8WZs
         wLGJA9K+erJkrCpR80ByiwNXEX2avAJmG7cXvFdOSm3cjFX647NHim0lLwIqZcVJdPxX
         p2PGFsGwof8Qv9vbuvjug8fmkO9UNsXa9WR+kfZxKuiJZkfoNUVSZC8BXZZEJAP+rgZh
         m+R8mLnY6zzOuLa/4sY0MaRk9xseSDoLvBkwIVhcOQUwCOhsGmcFmL2xAIGcKa4IEZMX
         /3EA==
X-Gm-Message-State: AFq9FYIEKA2dfmhPKeXqNP/K+6VjRIp5pyOGFFQ4rF4V8tsgvudQ4hJc
	Z4J3nD3117M1DebRWnVs92mq/+oPQ8xMo/NqXgiC65CGoRA4IlArZ9FIWKmHgOx/+4KhFTVVnMi
	zAxg2EOPzYgy1nSsnAx/ZwRWUzeXsdnFpCj31MVzciQ==
X-Gm-Gg: AYBFou2pENVBEQd3Arihx+hDV+VGN1pAky1h4btxhZYMIkljdy8UBMYUnhvlyVJMpJ+
	yYUAwfyHQNrrIV4SY9xZ27jgmF7T6QrwZnsS2UW4dlucKIDbHh/Q2yzZOTTf0RaBeiQstQ3R3Mt
	AG2w1kKIDz8WoIN3Kik4diTrr+QXgaxo9iiBZyKNZ+KEs0RzCwOinBZgQJmmy61hmpE/i/6VK0L
	7ggDdis2R8PwmIepqDEMPtX2tmPWSm82wFMxWKohWm7OkMVP0P+HbGtFF3yXo9VvwE/YdMrtQZB
	Ahoq/GK+i41kYWzWIM9udCk9zBWGniqaTmj59Ym/rDTqjoTpM3m86cWM7Q==
X-Received: by 2002:a05:690c:c4fa:b0:81e:fdf7:bfbd with SMTP id
 00721157ae682-8b07d3f34bcmr3829677b3.15.1791523271037; Thu, 08 Oct 2026
 22:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0058-v1-177573785904d0ea43c7@gmail.com>
 <sashiko-outbox-164704@kernel.org>
In-Reply-To: <sashiko-outbox-164704@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 9 Oct 2026 13:20:59 +0800
X-Gm-Features: AclHuK92qIoqNG0MkBBlGXX2dFLxfXGdSHBepuW05cjCXU4iOmEN_7GLCeUlGLg
Message-ID: <CAFRLqsUiCiCpgYkc+6BLLz=p+gw3hRHmxN-1LC9j7zkmiv7OpQ@mail.gmail.com>
Subject: Re: [PATCH] ocfs2/heartbeat: Unlink live slots when their node is missing
To: sashiko-reviews@lists.linux.dev
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review. The reported race is real: v1 closed the unlink
path, but o2hb_check_slot() could still admit a slot with a NULL node
after the last live slot in another region was removed, queuing an UP
event that hits the BUG_ON in o2hb_queue_node_event().

v2 will add the missing admission-side guard.

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=E6=97=A5=E5=91=
=A8=E4=BA=94 09:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] ocfs2: BUG_ON triggered by TOCTOU race in o2hb_check_slot af=
ter node removal
> --
>
> commit d6d3e4144add75ad80b3ba9eaf567ae43865596c
> Author: Cen Zhang <zzzccc427@gmail.com>
>
> ocfs2/heartbeat: Unlink live slots when their node is missing
>
> o2hb_shutdown_slot() returns immediately when its node is no longer
> in the configfs registry. A slot can still be linked in o2hb_live_slots
> when that lookup fails. Region teardown or startup-error cleanup then
> frees the slot array without removing its embedded list member.
>
> > diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.=
c
> > index a4c8ea695f5cf..43d98b4dce7da 100644
> > --- a/fs/ocfs2/cluster/heartbeat.c
> > +++ b/fs/ocfs2/cluster/heartbeat.c
> > @@ -880,8 +880,11 @@ static void o2hb_shutdown_slot(struct o2hb_disk_sl=
ot *slot)
> >       int queued =3D 0;
> >
> >       node =3D o2nm_get_node_by_num(slot->ds_node_num);
> > -     if (!node)
> > -             return;
> > +     /*
> > +      * The node may have been removed from the node table while this
> > +      * region's slot is still linked.  The list member must still be
> > +      * removed before the region releases its slot array.
> > +      */
> >
> >       spin_lock(&o2hb_live_lock);
> >       if (!list_empty(&slot->ds_live_item)) {
>
> [Severity: Critical]
> If a remote node is removed from configfs but still heartbeating in multi=
ple
> regions (e.g., A and B), o2nm_get_node_by_num() returns NULL.
>
> In Region A, o2hb_check_slot() evaluates the node. The node is NULL.
> It checks o2hb_live_node_bitmap and finds it true (since Region B conside=
rs
> it live). Region A drops o2hb_live_lock and proceeds.
>
> Concurrently, Region B shuts down. With this patch, o2hb_shutdown_slot()
> successfully removes the node's last live item from o2hb_live_slots and
> clears the bitmap, even though node =3D=3D NULL.
>
> Region A resumes, increments ds_changed_samples past O2HB_LIVE_THRESHOLD,
> and re-acquires o2hb_live_lock in o2hb_check_slot().
>
> Region A checks list_empty(&o2hb_live_slots[slot->ds_node_num]). Since Re=
gion
> B just emptied it during the TOCTOU window, this evaluates to true.
>
> Region A calls o2hb_queue_node_event(..., O2HB_NODE_UP_CB, node, ...).
>
> Since node is NULL, this directly triggers the explicit BUG_ON in
> o2hb_queue_node_event():
>
> fs/ocfs2/cluster/heartbeat.c:o2hb_queue_node_event() {
>     ...
>     BUG_ON((!node) && (type !=3D O2HB_NODE_DOWN_CB));
>     ...
> }
>
> Will this regression cause a kernel panic due to the BUG_ON when the race
> condition is met?
>
> While the race theoretically existed prior to the patch via the node dead
> timeout path, this patch directly triggers it during normal region teardo=
wn
> or startup-abort by deliberately allowing o2hb_live_slots to be emptied
> while node =3D=3D NULL.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/pm-ocfs2-objects-=
candidate-0058-v1-177573785904d0ea43c7@gmail.com?part=3D1
