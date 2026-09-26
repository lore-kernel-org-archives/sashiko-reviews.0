Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F236165E
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 19:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790449295; cv=pass; b=oUmftCDMcxjXgIhm/FPD2wCkyJ675m84RO/0Cfmn1xyPopO8V41/6vHbRsAbb0X+OxPptv7+VSMifxp9BR9hJ8/L7lujJ37wi1j9rpzmZ0cZvJIwHytOnEzOI9KyB7Yir831OlocrEiMc4wq2baH/YlWvVeexfGOC8poTSR4xc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790449295; c=relaxed/simple;
	bh=QNLd5ZM0DTy5A5tWcz6egfBN+B+fMPxGHb4yGaU4gNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDAIo1re7ci9md07NJydKDjxoG7Ga9vbb+JKZ5GuviGI+tjixVz0feADWYU6LvIigv/ifixYZU+vqiaoC3VQa7Lf3VZIiD8n+kUEPOn9k71WP53UKbtKJugKPUEBQxCK2aSrMT3I6Wq5NqrEeWA9fZwEpgRcASBAHaLPL4zvVbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAt1GYul; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAt1GYul"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b1ba286f6bso1747359b6e.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 12:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790449292; cv=none;
        d=google.com; s=arc-20260327;
        b=a1H+LGRW6MnK6C5aUW7rd+q3NHdghvId9RkRyYQ9fwOPeqDw0OQPN3BIp93F8J4voV
         W9uJDYB2bHbMuQLr7D0RGv3lYJZZNWCj8mq4O9SjOjjlkF1rOPn/OY0y89qIVaRVUBCs
         9V3eslCCQFjK1eNblQeEfYILqXTkO1PFQojJpV9Sw+rtMqdKeSBKm/0EVNufc8yOWlRL
         CNIBb4LjkylK9jKxz0gXXm2GYLSXcxDlnNcGefn+JtQk1G39AWXkFdlBP2rIIipZ+RLV
         2gdgug43ud6WHKJYgLjChJ9RHYFQHjxAmv9uypZ0X1UnvYtWGKLXcsSeSult1pUv1GLb
         IFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3tbC7alPXn1ycPKY3/iMVZU6UhNfUr4CxIq1lDYnho=;
        fh=CvI/CQm1w/T2awhAvXRM77KvHxvJuf/F+hTvEsd4hW4=;
        b=osU3Z0SSdsKzHrNPldY6OzcY9M1QJ0jRFelR1FPdvELx92BcmKaPZOYZ/oJ6158Xv9
         xoJ5MKQCFSSLZTSgqm4xOnghAqZqtwFSF3OCz8HkZbYnG7FnV5GJfl5eHnzOdR3NqNJ+
         fbWCo3GIQD7unuQw6fVsQLO7EZ5JV93Bf80pK7iVHpwL8rmd6KMUeKhWNUvNhkaqc0MI
         MXXt6pY1xbxlRxTwepPjarPl23GmYU2CMUbnINlhpneP+RzYkxcHCQ6JQLdqBcmb3uPA
         kSiEhbWKp8c+BAv7Ds30Wj8tJZAaHJ+ysxoLXAN3gy9AimNWgk2kKpWc3Ssy21VwR3+T
         8l6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790449292; x=1791054092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i3tbC7alPXn1ycPKY3/iMVZU6UhNfUr4CxIq1lDYnho=;
        b=MAt1GYulL/Jggiihcg4gzPZZ4b2/DLvrbfn+PTrclChAF2xOzRnjxd82XEBWimPFsr
         9eUS6iMGllrAFHFIZWoNncz52AWmtmTwU6nnpDSclq/00F/XN41NruhVxNl5A5jqmyXU
         ZWLO5MmADYgugb7cz6kEkLXs8c0EVwGvMKtjFvrjDNmuwQKzx/ShBpA/uhZiuGEl3Kyo
         Azt69cGQM7zIaYjMrSxki7vWVrSWOv2ecl5de99DbDg/vpzCfPO4HFpiGV1wlf3W7Nu3
         1nGxiaYzN+Ss4ZLwJ13zrNtdZaavB6enCeH291kTbiEARNN9Z5L1hg7cBmAg7Ivf+ItU
         JCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790449292; x=1791054092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3tbC7alPXn1ycPKY3/iMVZU6UhNfUr4CxIq1lDYnho=;
        b=JZM/BrCRjlnCe6OqzjGekVP00HpaS4TeIE0PvECxCpzOtvVa9cUohI+ah/MUhK49gb
         GeB5/4PqlBD088aK76vS7H9nAHG6G+ROKbjSwKzkfjLTgaR0/0xDiOk/zoQxmY8Ne6ge
         aQWJFujmoGgal57bOkNOkmJg3EfgLmRJ8GCGfwc1ny06l2ULJvA38byDVG1DXQ3puo7b
         MscgBheH2bTKd4jabG2yTO0qREltpCIOb/GwRkiRXs+3Ae5AHnf0xQzteN3k7GPeHvwL
         e8fpvler/W1RBxKiLs52KjLyQbs8lxoYhfHErrMyA2F0XFydAX3NRYguit3GBGUl+Whh
         /2Mw==
X-Gm-Message-State: AFuF++kvswq3frwT90wqUCY7H9StztjClJy5WgaEW7iQoxIgOfEhacTq
	Ao6joiPYKJRSrwY4cS13vjFaWSRdM4fL0Cg45N7msDwKnfyJ0JSne2sy7Q5X6E6L6fLMtbghP/O
	u5lLYnR3W2dzMHsR7V3dQa2pMfubC6q0doI3Yf50=
X-Gm-Gg: AYBFou1dN7ikGC1fR/XBZIkUGwzi2DVOIiYEbqZyAskp1t99NDcH4a7NSdkPaqxMnhp
	YY5BY7MT7ZBttZj0MCrP/kuoosvkcbbUp5evj1PN07gZNMIBr98l/y3VKOFaApwPdoQOnomnagC
	lnqaA6JTUE7vQ+pGUjf0kHyPxdXXyrMISdxktZet4Wrp/Y/Mvl5wxBGwwZinyHkk5DeCZkBDaff
	nD6+APT4Mg1US7K4NGFEGvFQ+e3nT79JCFePL2uGc2i8dehiGRdZ+76jK3g64h2NY5t9U4HsPGz
	p9+VQumzd0wi0miindXQ5ZNrbIw4IANwBdpzG2Tl/suAEzNyXp77xrNk5x49EltEojuwcYFvilk
	RPQwX0147Q/sg+jMdMAUueA==
X-Received: by 2002:a05:6808:1703:b0:4b8:4703:db8b with SMTP id
 5614622812f47-4d72b5426b8mr7600817b6e.20.1790449292385; Sat, 26 Sep 2026
 12:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926063328.257023-1-yupeng0921@gmail.com> <20260926063328.257023-3-yupeng0921@gmail.com>
 <20260926065324.4DD1C1F000FF@smtp.kernel.org>
In-Reply-To: <20260926065324.4DD1C1F000FF@smtp.kernel.org>
From: peng yu <yupeng0921@gmail.com>
Date: Sat, 26 Sep 2026 12:01:21 -0700
X-Gm-Features: AclHuK9bh320mFXDb6nwWnWGCW9-BX6fxJ4tfbfiN6xL1_m4-wynhGl3Ehp6eyg
Message-ID: <CAG3TDc3RAJkx=FYs2EgJBrwEXUk-smBPz8_6mL0aKWBP_+yr4A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] nvmet: add cgroup_id to charge namespace I/O to a cgroup
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] nvmet: missing cgroup accounting for Zone Management Receive
> --
>
> commit 95f26434d98f92b16ab088668a82d5d700b5986a
> Author: Peng Yu <yupeng0921@gmail.com>
> Subject: nvmet: add cgroup_id to charge namespace I/O to a cgroup
>
> This patch adds a cgroup_id attribute to the nvmet namespace configuratio=
n
> to allow controlling the I/Os used by the namespace. When configured, I/O
> submitted to block devices or files will be charged to the associated cgr=
oup.
> Only direct I/O is supported, as buffered I/O lacks the namespace context
> when handled by separate threads.
>
> [ ... ]
>
> > diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> > index 23a17c02abee2..a9836d44f5e6b 100644
> > --- a/drivers/nvme/target/zns.c
> > +++ b/drivers/nvme/target/zns.c
> > @@ -480,8 +480,11 @@ static void nvmet_bdev_zmgmt_send_work(struct work=
_struct *w)
> >       struct block_device *bdev =3D req->ns->bdev;
> >       sector_t zone_sectors =3D bdev_zone_sectors(bdev);
> >       u16 status =3D NVME_SC_SUCCESS;
> > +     bool associated;
> >       int ret;
> >
> > +     associated =3D nvmet_blkcg_begin(req->ns);
> > +
>
> [Severity: Medium]
> Since cgroup accounting is added to the zone management send worker here,
> shouldn't it also be added to nvmet_bdev_zone_zmgmt_recv_work() in the sa=
me
> file?
>
> Currently, nvmet_bdev_zone_zmgmt_recv_work() initiates synchronous I/O fr=
om a
> worker thread:
>
>         ret =3D blkdev_report_zones(req->ns->bdev, start_sect, req_slba_n=
r_zones,
>                                   nvmet_bdev_report_zone_cb, &rz_data);
>
> Without wrapping this operation in nvmet_blkcg_begin() and nvmet_blkcg_en=
d(),
> the I/O from Zone Management Receive commands escapes the namespace's cgr=
oup
> and is charged to the root or worker cgroup. Does this lead to bypassed
> cgroup I/O limits and incorrect statistics?
>
> >       if (op =3D=3D REQ_OP_LAST) {
> >               req->error_loc =3D offsetof(struct nvme_zone_mgmt_send_cm=
d, zsa);
> >               status =3D NVME_SC_ZONE_INVALID_TRANSITION | NVME_STATUS_=
DNR;
> > @@ -511,6 +514,7 @@ static void nvmet_bdev_zmgmt_send_work(struct work_=
struct *w)
> >               status =3D blkdev_zone_mgmt_errno_to_nvme_status(ret);
> >
> >  out:
> > +     nvmet_blkcg_end(associated);
> >       nvmet_req_complete(req, status);
> >  }

I think these requests are not normal IO requests and don't carry the on di=
sk
data. Should we just exclude them from the cgroup limitations? Thus we let
them bypass the cgroup I/O limits by design.


> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926063328.25=
7023-1-yupeng0921@gmail.com?part=3D2
