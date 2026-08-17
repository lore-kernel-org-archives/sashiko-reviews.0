Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B934399F8
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974127; cv=none; b=VMbuTM+1RTk6cuWbNhiCN57j561zbE+hG5WLkfZsEWrBdAbISVi94t5WAiAqqUjdnyp4N5+s0tM8McpBwvBZA98lCRo7RPMtYcxM/lahrEF+8aQVBrKYl2n4te11yo35kJM26W+BAD84zZQK7xfBsmyv48oQ3tQh6x3+lDJQ+n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974127; c=relaxed/simple;
	bh=5t0+awvIEoaGKqMdu39TCk34rZ/73tsfHuxRUuz9SGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9sF0hv5kTpmLSEbIXU2olRksUyI7pBIpYdMzk53ieKVd6//L3y3ct3tIXnXQ1OR4TGLATBYqhDmQK1CdvanHlCd5fRNMpAbXgZr5vXI25OxU7wmKL+YIlrsZplnCHwSjo/4z3qT/z4r3j07K1wMFdoSpdr+bCHQCTELCJhdtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPyeYmqH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPyeYmqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786974120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nar5TPwp4YomIFNBACklaS1XT648jZLKltDco2A2dR0=;
	b=EPyeYmqHjsj9pXA9uPXyel6RKmDnKpJV0IH36hOyYm4JANoB/8qrQLeOGwO0nFdFKAzpti
	cPEfnAqmK2smrTv2X+KeGI1tLHAHvW0be4OFKX+tYqDJSfFw+JnKZXmVy6lNObLV/QdAfF
	Lris5VF7OTeXbUn6Ag6YUQunh5+Vrzk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-WFMhlakUP96tlkFPPiYlmg-1; Mon, 17 Aug 2026 09:41:53 -0400
X-MC-Unique: WFMhlakUP96tlkFPPiYlmg-1
X-Mimecast-MFC-AGG-ID: WFMhlakUP96tlkFPPiYlmg_1786974112
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47fecbb7f88so2338707f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 06:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974112; x=1787578912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nar5TPwp4YomIFNBACklaS1XT648jZLKltDco2A2dR0=;
        b=ZZGvJKwV8dV/TBFLD++VFg8GBT9c+PFqxB5yk3s5x6x73xG9oLT+rtdS5uCckxsTUo
         NvBKttydqXsLv1jhu6J0o8zMkRJhy8BtJZfYRdIW94jCNygiypL+hapOhMYVzE6XMpL5
         ZOX8LmvQowF9dQh0UHMkkZJzloReJXAweuOkYGViNph9zIvZr9jZXuykzoxjcB0nP5Yq
         DdxGCawv7/Qhe8j9D22vKt2jiaYCqpeoHQpM7QVyIkyU2i88EwG3B42VGRTuD/9QkkAd
         nwFJk8m3yhPVU27usrRLHRGYVL0PjLh1B53/GHVuMwyy18wVusjqGOAlrRcyecX/o6vS
         RSVA==
X-Gm-Message-State: AOJu0YzbJXX/jsRwekYXei6iY0rFyF49qyFDqfEt6tzqmwK6Zn0pA6r9
	rOw7hLFvdAw6/PVtnexJ4xY3Fkk5AtWgs10IWagsLk/1Fhs0dEAv9Hle/iERVbJBNYxhrYbBIBx
	f8sIpFLeubgNE4kc1+zAJp39v6TzQWi+9AWqZjh7OS9mJVNW6CXlMt6l5AFfau/qwKmHYHj78V1
	tosAocO6Eq/3btogTlWVXJK7ryEXSZ4IpSyU+aekWs+lgTrs17dy8s
X-Gm-Gg: AR+sD10arJ0pOh8UIx+MT8WRyAbp3woEOqpGzmlZvLyz5IJFKEhFD/4y2UZxW+iCfdj
	D2M0lVZIQGUVtwQqgWN9vrZPp8ncCgzFaXFnJD3k93HTrgpiH0zJuCkUv7HutoLQFQm9Ouy0zeh
	67LZ3yUHUUnqyCudf19cmjFiRjvsedvnb6/qioZ4xWWlwK7N2prf7A08YD3Ke5iepTLUNsw8+ur
	/2N+QjYrS1ROHXi2g==
X-Received: by 2002:a05:6000:2612:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-48160758afcmr42033780f8f.17.1786974112291;
        Mon, 17 Aug 2026 06:41:52 -0700 (PDT)
X-Received: by 2002:a05:6000:2612:b0:47f:c648:e265 with SMTP id
 ffacd0b85a97d-48160758afcmr42033697f8f.17.1786974111934; Mon, 17 Aug 2026
 06:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812181300.3712426-1-jtaubepe@redhat.com> <20260812181300.3712426-3-jtaubepe@redhat.com>
 <20260812182142.3207A1F00A3E@smtp.kernel.org>
In-Reply-To: <20260812182142.3207A1F00A3E@smtp.kernel.org>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Mon, 17 Aug 2026 09:41:39 -0400
X-Gm-Features: AcwNN1UC6sQe5yjBCYZbkjh1cT7tfFNaedkvSo-HYeu9LkQg5W4yToVKNkirk2E
Message-ID: <CADRr4bfRsLn2fYcCepK9EjOCn+PH2KUCf6KXcd-a=Hu57LNZRw@mail.gmail.com>
Subject: Re: [PATCH 02/13] nvme: add NVME_CTRL_MARGINAL flag
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pGFLymKJauTIkRTF_sxBxp1buzeT9NI-4xNYN9IsdVg_1786974112
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The NVME_CTRL_MARGINAL flag is cleared on the wrong structure's =
flags field in the Fibre Channel transport.
> - [Medium] The NVME_CTRL_MARGINAL flag is not cleared universally on all =
controller resets, leaving non-FC transports and manual resets permanently =
in a marginal state.
> --
>
> --- Patch [2]: [PATCH 02/13] nvme: add NVME_CTRL_MARGINAL flag ---
> commit f9c336bbdc7993d3daa484b869cd6845d7fce7a7
> Author: Bryan Gurney <bgurney@redhat.com>
>
> nvme: add NVME_CTRL_MARGINAL flag
>
> Add a new controller flag, NVME_CTRL_MARGINAL, to help multipath I/O
> policies to react to a path that is set to a "marginal" state.
> The flag is cleared on controller reset, which is often the case when
> faulty cabling or transceiver hardware is replaced.
>
> [ ... ]
>
> > diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
> > index 04363b9c4489e..d2ca65f70a0c5 100644
> > --- a/drivers/nvme/host/fc.c
> > +++ b/drivers/nvme/host/fc.c
> > @@ -788,6 +788,10 @@ nvme_fc_ctrl_connectivity_loss(struct nvme_fc_ctrl=
 *ctrl)
> >               "Reconnect", ctrl->cnum);
> >
> >       set_bit(ASSOC_FAILED, &ctrl->flags);
> > +
> > +     /* clear 'marginal' flag as controller will be reset */
> > +     clear_bit(NVME_CTRL_MARGINAL, &ctrl->flags);
>
> [Severity: High]
> Does this clear the flag on the wrong structure?

Yes, Will fix.

>
> Here, ctrl is a pointer to struct nvme_fc_ctrl. Clearing the bit on
> &ctrl->flags will affect the FC-specific flags field instead of the inten=
ded
> core NVMe controller flags (&ctrl->ctrl.flags).
>
> [Severity: Medium]
> Will other transports remain in a marginal state indefinitely?

Yes, this is intended it wont affect their functionality.

> The commit message mentions the flag is cleared on controller reset, but =
the
> clearing logic is only added here in the FC-specific connectivity loss ha=
ndler.
>
> Should this flag instead be cleared universally inside nvme_reset_ctrl() =
in
> drivers/nvme/host/core.c to ensure PCIe, TCP, and RDMA paths also recover
> after a reset?
>
> drivers/nvme/host/core.c:nvme_reset_ctrl() {
>     if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
>         return -EBUSY;
>     ...
>
> > +
> >       nvme_reset_ctrl(&ctrl->ctrl);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812181300.37=
12426-1-jtaubepe@redhat.com?part=3D2
>

