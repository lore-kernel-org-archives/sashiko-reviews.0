Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0903B42CB
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479068; cv=pass; b=GTWHfFOhuv4BHMeY+TfsYaV+NNr0HhWM8wvpEkaS55qKw6pC6tbOvj26ZHDroSQCv3NEXxpf821bKtsroT9igl9B+Z/mXnJISlcpskYzMFYJkoXmEJw4TFZxx0xBYEtQu2lT7aqiFfQyHhympcboMlYlgIBr02y34BWmmWRjw4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479068; c=relaxed/simple;
	bh=+/k81FNUEICxsqWdDA6+9UGvMKD0Du9jknRT1mqWjSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4M5iNGSdDl5Ycdy84iEIjsHPO6NAx0XjyTUOhCE5B48qWY9+dxYnthM7oC8utDo2m2eymC2EdFBbsTtTlR2RmGaVmxfb8PmDgoqnekgfuGYtE9z268Bn3QDTd6+lwbSJTipGsUf8jqrWB5ljoefdZZiOEqOYW40jJr/bSVX/Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG1eYPzM; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG1eYPzM"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067eso309017185a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 06:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789479064; cv=none;
        d=google.com; s=arc-20260327;
        b=I1Y0ykm/y6Nq36Veb7lsfcUmeZpRaWntGJyFwRjytzMptDvHnhrR1gj1NJIFMaSCVN
         /cVX4QXJtEOW2lc10jvc7IbkK3JdmyvchuL7FlHMTDeLdQJxln2E89wDp/Wbiw5pBYr1
         qlqDzQi3e8+Lkhfdsir9NPz9uSGP9XC1wSHPy3s068vvPgIUfMetjraa2xsMulzha3Nr
         tmSQ2JhHDZcE0Am/IFmXLQ04ClBUzaxOsXEmZokf4UpkmqSr3uPr7c62WNACfJRxgufa
         pI+NPoCP9M7iT5ItALrUyDZKfUyvvLlk7gMMEJFLxic7qwWMH/njGvkBKXosgogd+wXP
         bNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGT5OSwSiWiMNxoJJTHbLPnbmEfhViALvNX2hFXt9mY=;
        fh=g9Oe5K09T9jBWfPrqkUOZ1y6/7GSsyXSECS6xWWN14g=;
        b=Ovs+cF72hxaTzvwG69OWwF1gzqdb/7H/rMO2jmrZjxlqt3w1196wGoWzFgYt/ZVOE3
         ubbiM+FRcIkxSl8OnjV0fWz6i8t3USfAMTCWFVgrAC1GJCh0DlSucevBSucQzObP0gQJ
         ahiRdqlo+Aoa27yTJXsiJBCh8SEWPwDmi9g960pCzkhbJzKdDDHIHBIlwXe2ybxkzK0d
         RT6He8IdvSGP7TRgocdytoTgUAWBltkpdxkBhiEoSgOLphZGZ753wFD0RbrIEfp/f0Kf
         bn4iX/VKEAEBPf8VwgSXMTdC129JgMI8wFR7D2V4XC3H1ogut4lxQVfARAztbbyfnrp7
         SE3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789479064; x=1790083864; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGT5OSwSiWiMNxoJJTHbLPnbmEfhViALvNX2hFXt9mY=;
        b=QG1eYPzMi8slli44kwE/aKf9LZ0xoKmufKbuO3heBNapWUfUbkLqe5jnMt5TjhKstm
         z20VUbTaiM9g4yhkXtLvYlkl5VSiiTPjOm5j92rc5bpTaIpKy2b3l9yTDxJQ/AKnW3YW
         QokAkcGs31gqHghn7Jb1r9swmYW6JpQ+5MP0vxUEuNOF02p0yiQ08dFgoSLLhNfqnMrP
         b4GtIy/cSpyeFrA7H35JI4UBPghCZMRmWeGbQOZhkKdU0Wb7/gSxOllPDfwdQfvKmdpq
         KA2dWwUOEafEFXyuzNuqrdrOhlkwqCPUQMgcHH2IVQibQ/TSP+GUgBjPMff5G27WaNdW
         ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479064; x=1790083864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGT5OSwSiWiMNxoJJTHbLPnbmEfhViALvNX2hFXt9mY=;
        b=JRdqZikvbHz+mq/f+G3M/gurMpZ/U7dZCfrkUuHs8DEs+k3XEsLRUacDwT49AgxCMU
         K1TRh8cLIPcsf0k8bRHaDmnV4WtZnJafqZ/8UPZ1jnFDslOoIGkgLkTqvzWvuu2jZsRb
         4+56HnOg8U9o4Uo9D8IzB5zOf234V620/BMdqAg6XHRt5jT8gDXmWwGIbvsTQ8ffRxAI
         WOa5suEomXMgmux+WDaf66aMAHt/mq0KyzaLNDwfznVwDNjif+KFVdbAWk9UpTkRFO3Z
         e5+hVtjcnnZnlrV0ejWBiyWDkkRpiltSJYop2m7UDQ2oLCQ+fEQ+0zxsyffp237/QvdU
         OMqA==
X-Gm-Message-State: AFuF++mfZb2pbVpRfarPw9DoFN7X8o6+XYEVAN+LszsS9bclS032k9Fl
	/WOTDr/qBj8y/FMbF9kyOOE5w5ENipFMCowFwLDY3Dox5A/H3/ykDM6AUkCmSxtJMeQOAnb3Qq6
	YbFNwXSwKqFFGV6hgx4KfmkgBAbB9Lv4=
X-Gm-Gg: AYBFou0fjqljexCSxhV4++4RZf656xuLmwuoNMjLgZkOLbDp8DZ9IIDzTPgBZ6rw0sz
	/O/luBoZVPqGqF+hUUY7jGMNZhwcA5Th+gCwzOqXOvPVKcyO3INN4bVJslw1+uxoWhfvA7S7oJM
	3mugRwKrsDXXjZ1m07NWy3Y13XF8xVz7bNyLJbLkjk3rt757fnUVTbzW5wm3GnJqNEwA4wA/1z4
	NB5JDltKSaJxxLmrm6tqU4joazLxh4c+9/cpCUMWr81t5mYYBcNbgBS0Otw1ODxYGwvdic80lwl
	qpKCuSL6+txgOJEAkDNbD6/oQEJdz7UV0XW5CCdS+nEu9zAtC46PBzw=
X-Received: by 2002:a05:620a:3902:b0:92e:5b92:98bb with SMTP id
 af79cd13be357-93a297ca655mr1074600185a.14.1789479063731; Tue, 15 Sep 2026
 06:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912090420.47439-1-physicalmtea@gmail.com>
 <20260913090452.2B8221F00893@smtp.kernel.org> <CAJwVaMKtk=PxFq330K8NBLRF7FzgcSu32vt1irLEJ7dSRQ5A_w@mail.gmail.com>
 <20260915070050-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260915070050-mutt-send-email-mst@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Tue, 15 Sep 2026 21:30:27 +0800
X-Gm-Features: AcwNN1WCssAbpLV_bseDxWD-pSbF-fj7FUW_YTjH1e6x6iS_yDJLEwUT0YuzDSs
Message-ID: <CAJwVaMLsAcRt609Wmz=G-G3j7xDj5+0QK-Ck2ko1pcwerMeb5w@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: do not relock event vq mutex on send_evt fallback
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, virtualization@lists.linux.dev, 
	Eugenio Perez <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Mon, Sep 14, 2026 at 04:38:57PM +0800, Jia Jia wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > >
> > > Pre-existing issues:
> > > - [Critical] vhost_scsi_do_evt_work() accesses vq->iov[out] without v=
erifying that the guest actually provided an input buffer, leading to arbit=
rary user-space memory corruption.
> > > - [High] Events are processed in LIFO order instead of FIFO, which ca=
n cause state corruption for hotplug/hotunplug sequences.
> > > --
> > >
> > > commit 05830c30fc2e4dc682c270a9b487ae5abb66218b
> > > Author: Jia Jia <physicalmtea@gmail.com>
> > >
> > > vhost-scsi: do not relock event vq mutex on send_evt fallback
> > >
> > > This commit resolves a deadlock during fallback event handling when t=
he vhost
> > > worker has disconnected. It splits event completion into an internal =
unlocked
> > > helper and a locked wrapper to safely reuse the completion path.
> > >
> > > Link: https://lore.kernel.org/all/20260905005352.1E5B01F00A3D@smtp.ke=
rnel.org/
> > >
> > > > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > > > index 4f8c0260bc9e7..42abf18291b75 100644
> > > > --- a/drivers/vhost/scsi.c
> > > > +++ b/drivers/vhost/scsi.c
> > > > @@ -660,19 +660,26 @@ vhost_scsi_do_evt_work(struct vhost_scsi *vs,=
 struct vhost_scsi_evt *evt)
> > > >       vhost_scsi_log_write(vq, vq_log, log_num);
> > > >  }
> > > >
> > > > -static void vhost_scsi_complete_events(struct vhost_scsi *vs, bool=
 drop)
> > > > +/* Caller must hold the event virtqueue mutex. */
> > > > +static void __vhost_scsi_complete_events(struct vhost_scsi *vs, bo=
ol drop)
> > > >  {
> > > > -     struct vhost_virtqueue *vq =3D &vs->vqs[VHOST_SCSI_VQ_EVT].vq=
;
> > > >       struct vhost_scsi_evt *evt, *t;
> > > >       struct llist_node *llnode;
> > > >
> > > > -     mutex_lock(&vq->mutex);
> > > >       llnode =3D llist_del_all(&vs->vs_event_list);
> > > >       llist_for_each_entry_safe(evt, t, llnode, list) {
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but does this loop deliver events to th=
e guest
> > > in reverse order?
> > >
> > > The events are added to vs_event_list using llist_add(), which constr=
ucts a
> > > last-in, first-out list. Because lnode is retrieved locklessly with
> > > llist_del_all(), and the iteration happens without first calling
> > > llist_reverse_order(), the events appear to be processed from newest =
to
> > > oldest.
> > >
> > > Could this cause state corruption for hotplug and hotunplug sequences=
? For
> > > example, if a device is plugged and then rapidly unplugged, the guest=
 might
> > > receive the unplug event first and the plug event second, leaving it
> > > erroneously believing the device is still present.
> > >
> >
> > Looks like this could get the acquire order wrong? Need to verify.
>
>
> didn't look into this yet - did u reach any conclusion?
>

Already reproduced this using a test program. To hit what Sashiko AI descri=
bed,
need multiple vhost_scsi_send_evt->llist_add (at least 2) before the
worker schedules
vhost_scsi_complete_events(false).

I personally think this is not very easy to hit, first this kind of
hotplug/unplug event is not very frequent,
even if there are multiple calls, as long as the worker is idle it
will run vhost_scsi_complete_events(false)
quickly, so pending is often only 1.

So to reproduce, I created multiple LUNs, and concurrently called 8 ln
-s (only triggers RESCAN,
no unplug, extra LUNs are just so we can see the lun numbers better).
This increases the chance that
vhost_scsi_send_evt races in before vhost_scsi_complete_events(false)
runs, so there are at least 2+ pending llist.
Finally when vhost_scsi_complete_events(false) runs, the guest sees
the later-linked LUN first.
(before testing I thought this needed a lot of SCSI I/O to reproduce,
actually it doesn't)
I only tested plug, the guest did see add LUN order reversed.


> > > >               if (!drop)
> > > >                       vhost_scsi_do_evt_work(vs, evt);
> > >
> > > [Severity: Critical]
> > > This is a pre-existing issue, but can this function access out-of-bou=
nds or
> > > stale memory if the guest provides an empty input buffer?
> > >
> > > Looking at vhost_scsi_do_evt_work() in drivers/vhost/scsi.c, the code=
 uses
> > > vhost_get_vq_desc() which populates vq->iov:
> > >
> > >     head =3D vhost_get_vq_desc(vq, vq->iov,
> > >             ARRAY_SIZE(vq->iov), &out, &in,
> > >             vq_log, &log_num);
> > >     ...
> > >     if ((vq->iov[out].iov_len !=3D sizeof(struct virtio_scsi_event)))=
 {
> > >         vq_err(vq, "Expecting virtio_scsi_event, got %zu bytes\n",
> > >                 vq->iov[out].iov_len);
> > >
> > > If a guest submits a descriptor chain with only read-only descriptors=
,
> > > vhost_get_vq_desc() sets in =3D 0. The out variable holds the count o=
f
> > > read-only descriptors, meaning the first writable descriptor expected=
 by the
> > > host would be at index out.
> > >
> >
> > This is a dup -- an earlier patch already fixed it:
> > https://lore.kernel.org/all/20260904005240.502787-1-physicalmtea@gmail.=
com/
> > It was while fixing that earlier issue that Sashiko spotted this
> > adjacent problem.
> >
> > > Does the length check above access vq->iov[out].iov_len without verif=
ying
> > > that in > 0?
> > >
> > > If in is 0, vq->iov[out] was not populated by vhost_get_vq_desc() and
> > > contains stale data from a previous request. Could a malicious guest =
use
> > > this to force the kernel to write the event structure to a previously
> > > legitimate but now hot-unplugged host virtual address via the
> > > __copy_to_user() call later in the function?
> > >
> > > >               vhost_scsi_free_evt(vs, evt);
> > > >       }
> > > > +}
> > >
> > > [ ... ]
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026091209042=
0.47439-1-physicalmtea@gmail.com?part=3D1
>
