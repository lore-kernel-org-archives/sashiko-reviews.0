Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49591280CE5
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976695; cv=none; b=mW48Df1P3vHxaqjFGQVJYPe0ljzWO7vM9RJ66HLzkvXV2P1E0XKpwvBCuvxImBh8e4ySEWcmAbEnSsKMYesqWL6msxrFxM1br19zNA1DM1vj0Uz6NEt5JevPQ98VTtWq799Pv0daWO+l8ri/BoGgyGZYe7RXLe7jGnzv29Wffv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976695; c=relaxed/simple;
	bh=5zMANYOL6OMX63n9a2mTSlmz6sYz7y/VGD+m3NyD6Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db/fzcsjjaaJTeDLOv8gMGmGKxIuInJKWj24gMMuE+lbgtq8nl3tL8145uKiMXv24q6APdlaZa2UoAav+qgFW8zH02yaxR1T2AR2patetB4iDtHr2/ZOjPeVP74+q0qqPCKP9Zc7cdam2PN/WudVHCYmpxBERAkCdCxOxXMKKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CowN5jpY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CowN5jpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786976693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1AzHe4P7wnTJu3tJI94lrInGSy7mvVyAJicROGnecY=;
	b=CowN5jpYpdcoWWvvBXBMEQJPhtFjyy6TLXuOClVQyVR92Qd3DQweR/jPx+PFDiYrKNG8yW
	Jhx+KL20pTH6c4dPzhxLK6AizVfAdF3TkqBShzbmqY8O8jEherye6Rtp0W4DF6TWU1Qtkz
	GPAFRDbPsKR/D108/NzeYkSYFgx6kss=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-6KKvG9g5OHGDxJ8kvFq8ow-1; Mon, 17 Aug 2026 10:24:50 -0400
X-MC-Unique: 6KKvG9g5OHGDxJ8kvFq8ow-1
X-Mimecast-MFC-AGG-ID: 6KKvG9g5OHGDxJ8kvFq8ow_1786976690
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-499900c9d99so16642735e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 07:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976689; x=1787581489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1AzHe4P7wnTJu3tJI94lrInGSy7mvVyAJicROGnecY=;
        b=LBV7l8OPoGtVZ74hJ2TC8B51qsb6MfpmdTmPaf8Hzi5DsVe73TsvRh2oq/f1oyx6xB
         3OETcoL/7IjARrupKNywJG9suQgV5Ns0G1eyVi8pRjm04rip3NPPUluJy0ux95nOR1On
         CNC/bIJIUZ6HAvzcWDREhklX6ID40USU8A81uWxKfRmRR5ZqsRt1K8dMbvT3rK1KHdZg
         UVL6Gukb8d8s0KA1x4aHTfQxei0vMoXQ5VVSoX8ax05NJStHirJw5a1Zg1pi7MgOcMfM
         +2FBW8tAdlV2AhGVxbWmPshBkIXdwVKYKw4/sYc2i4ZkoBoE7MPut73z+7Vky3/KcfbC
         g4Nw==
X-Gm-Message-State: AOJu0Yz/473z1z5CBtJwimNoJ7KW8vmKD5QJMqBtEIoUMU8JrWhMGS4U
	zWlB6JDVgylGoDmFBl+tpFP4w7qpRa3TUH18gp1zXu/ScQ1xOhqLGBl8kDCLUQOh0gqXfg3CGOV
	EQb2zQPLqxd1VEZQUFzuv1Xn6H7u1N3h+C2nGfVGWe7gUaoXv6xRwxlcb+Qd2ruH4vP6M3+qPH+
	7M0fNCgVk+YgB1ysewLzVTRrpE+axunymKQejDOKolk7OZzcUXi6ui
X-Gm-Gg: AR+sD11ywFfmXlCGFCwp+NwB7KXVY2X34v8N+KoLjgoEJBsNAAThed/2VAar3nWLw7i
	oTTwuJgE2gOIusWxfRzD5hwwivhnoz1UivkR6MVeCXuIhHLPoVYd/H0Q9xMRjsvHbWoMcbMZfnd
	q8Cq+RI4VUllqTGDGyO5YlhQd4uztdrfgzBv6GmcCO47IJX4SxOuU6BmOPU457SffQ5uSnAgbyg
	mcNaBNvDj2C2+WAwA==
X-Received: by 2002:a05:600c:8509:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-499879337acmr453690285e9.5.1786976689577;
        Mon, 17 Aug 2026 07:24:49 -0700 (PDT)
X-Received: by 2002:a05:600c:8509:b0:496:c9cd:e7ab with SMTP id
 5b1f17b1804b1-499879337acmr453689025e9.5.1786976688989; Mon, 17 Aug 2026
 07:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812181300.3712426-1-jtaubepe@redhat.com> <20260812181300.3712426-10-jtaubepe@redhat.com>
 <20260812182733.309881F000E9@smtp.kernel.org>
In-Reply-To: <20260812182733.309881F000E9@smtp.kernel.org>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Mon, 17 Aug 2026 10:24:36 -0400
X-Gm-Features: AcwNN1U5N3XQmwsxmOb1TCuFX1muZNY1UIu4l6yc7tEcDI5Zd5X-qM0qbhm5h-M
Message-ID: <CADRr4bd_aa=W7DMxzcJA+50TQh8WHtdEmAPtdFzJ_WjqbnTuow@mail.gmail.com>
Subject: Re: [PATCH 09/13] nvme-fc: add nvme_fc_set_remoteport_fpin()
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sGWRmXqnDhT5PmEdOKekTOOu5x3SThCLkeO_4vpXwhM_1786976690
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] `nvme_fc_ctrl_connectivity_loss()` clears the `NVME_CTRL_MARGINA=
L` bit on the wrong structure's flags field, causing state corruption and p=
ermanent marginal state.
> --
>
> --- Patch [9]: [PATCH 09/13] nvme-fc: add nvme_fc_set_remoteport_fpin() -=
--
> commit a1aaa3c652a2b842059c76da3884f9c0dcb9925a
> Author: Jesse Taube <jtaubepe@redhat.com>
>
> nvme-fc: add nvme_fc_set_remoteport_fpin()
>
> Add nvme_fc_set_remoteport_fpin() and supporting functions. This
> function is called by the SCSI FC transport and driver layer to set or
> clear the 'marginal' path status for a specific rport.
>
> > diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> > index d2ca65f70a0c5..4acf23ea8aea2 100644
> > --- a/drivers/nvme/host/fc.c
> > +++ b/drivers/nvme/host/fc.c
> > @@ -895,6 +895,22 @@ nvme_fc_set_remoteport_devloss(struct nvme_fc_remo=
te_port *portptr,
> >  }
> >  EXPORT_SYMBOL_GPL(nvme_fc_set_remoteport_devloss);
> >
> > +void
> > +nvme_fc_set_remoteport_fpin(struct nvme_fc_remote_port *portptr, bool =
marginal)
> > +{
> > +     struct nvme_fc_rport *rport =3D remoteport_to_rport(portptr);
> > +     struct nvme_fc_ctrl *ctrl;
> > +
> > +     spin_lock_irq(&rport->lock);
> > +     list_for_each_entry(ctrl, &rport->ctrl_list, ctrl_list) {
> > +             if (marginal)
> > +                     set_bit(NVME_CTRL_MARGINAL, &ctrl->ctrl.flags);
> > +             else
> > +                     clear_bit(NVME_CTRL_MARGINAL, &ctrl->ctrl.flags);
>
> [Severity: High]
> This code correctly uses &ctrl->ctrl.flags for NVME_CTRL_MARGINAL. Howeve=
r, in
> nvme_fc_ctrl_connectivity_loss() introduced in the earlier commit "nvme: =
add
> NVME_CTRL_MARGINAL flag", the marginal state is cleared like this:
>
> drivers/nvme/host/fc.c:nvme_fc_ctrl_connectivity_loss() {
>         ...
>         /* clear 'marginal' flag as controller will be reset */
>         clear_bit(NVME_CTRL_MARGINAL, &ctrl->flags);
>         ...
> }
>
> Could clearing NVME_CTRL_MARGINAL on the transport-specific &ctrl->flags
> instead of &ctrl->ctrl.flags leave the NVMe controller permanently marked=
 as
> marginal across reconnects, preventing the multipath scheduler from fully
> utilizing the repaired path?

Will fix, same issue brought up earlier.

>
> > +     }
> > +     spin_unlock_irq(&rport->lock);
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812181300.37=
12426-1-jtaubepe@redhat.com?part=3D9
>

