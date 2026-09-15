Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595DA47F2CC
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483625; cv=none; b=k4cQQcpFOeHdOfDA314Z6BPMqrGNjyf0t7ZTVtr/9yMxt+soDDws0vRrXBdMFtJ6UrK+GmoZwgSF0hG38qSuzQoH3BR92X1g5rWLcq36wpFtDVfHAXDuTAmXOSTefzFqDB9a1M6h8b5AibazX9+mZD+GIr1w8WSL3OIEG5Ftpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483625; c=relaxed/simple;
	bh=MczMyZ/5WpjnK3wtlqRK+hsmtRpFJuXNeJAZ4SM1PO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fcVrGyZXKz8h+pra7rKcMfzPN0Bi5XR5WjaN5ZbDS1zLFUKIUJU/Xd0EeyC9X18TT6Qm5Ynw5QuylF5IlK+hz9lsE5XXwZwVbdFcHujsO7O/XNTagYQtT1A/pLWaj0MkL14Dma6E7HQar7JG/CR8HX1KOcTQXosUngdFxSOaneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jJvsJ1qh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jJvsJ1qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789483616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5N5AF827aB5n+anIjvA7OfREw3AKCiRNrgDChZLUg4=;
	b=jJvsJ1qhOufbU4PbMABUtTXljFQkcZhBZn1743zj+FTtWGE3dblEfpPw2QtpbEFspdjjK+
	oAW//IXEN0wRWngoBZcBqmAQFtuxrIqu7iM9Cu2TnF5TOS8H5g5Aj0aXw4qBU8gcO/aTDQ
	Z3pmK/t5glIlxdvoQOoX5kfwQQlNToU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-uT6qjl_TM6eexfwqMEYv1g-1; Tue, 15 Sep 2026 10:46:54 -0400
X-MC-Unique: uT6qjl_TM6eexfwqMEYv1g-1
X-Mimecast-MFC-AGG-ID: uT6qjl_TM6eexfwqMEYv1g_1789483613
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so26245735e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 07:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483612; x=1790088412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d5N5AF827aB5n+anIjvA7OfREw3AKCiRNrgDChZLUg4=;
        b=v4iAOcrZkRip1d9XomanHzXmsOt4uUwKubaGBuY57aYg4gdcP0/GCf5jaq1fKEh+Gs
         TrE1YwGC1fKvCNsmdmAyzpnOEFsd298D9YMLoXo65LAY4FyhoRTpFCtS/JFwzFCEcw8C
         xRdfUBmfoTVyE7yJnQE9NJvSphb0ZJ3Yews/8GbbykuG/izFwiHh6qHLpP+zRx7dIdOS
         psuBeOXlHXglrAOrKB8GRQVBmW7yOrS7ZRXVl86Hml9JC3VJAD/iUhwRD8I+JTmxG82H
         Qnx/Fl1r2BBQG/yfT0c7jHLmRI/70JHoMMKWRJXqcgF2rYmTzTxN57Qyvokuw0GhGy1r
         UDpA==
X-Gm-Message-State: AFuF++mKjxNiCsAIgOagZgBaIchDSa5RSfMTc91qw3jYgWYQhII+j7sY
	EryEUJW9krhystOXL+HX+j1ghG+SABzSMjlWUIiz/fhdRdGMbG3Zv/k3Orq1ZnFme1dnKMircu3
	95OCHvFZZ1FSx94OB38iDdFfwTsxBRYjC3RuX/e8CLTm1DBsr+jsABCebEFxPNWdE7bHd/g==
X-Gm-Gg: AYBFou1XMaerC+657heopqxqMrTFtz760e5yY48kSJ7soj+STvuIC+QdarM8Wzeinu3
	fdWlk1JoTNH/Y33S6uNYH4X9dS38vA3M8j1hdvYt3nOXawqS4H6U43LnS0GEdHHrFCuFmP3RSPM
	1ResfkqudWR+fN5KrUcBYIlzhrFsD+Qp3Y503iZCF6DhNm9/Rnu14kgmJQasnxiirhA3VVyJbPn
	ojDr96d+kEvsIfxIrvWgwsn/qVbgk+UcQfUHb0j8pl1UqdNhLFWy7Hu3fEaJxkS5JIeUZSDQg1z
	Vydr36WJ+Z2CVS6Vbzq5DSVURivV7vde/9QaZRtQP5N2mGEav18T0UxKsePtyKPIfkE03aKIW/L
	b6ahKe5PAtKxh4GhnNm9XF6U=
X-Received: by 2002:a05:600c:620e:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49e7a69c01fmr110713925e9.30.1789483612394;
        Tue, 15 Sep 2026 07:46:52 -0700 (PDT)
X-Received: by 2002:a05:600c:620e:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49e7a69c01fmr110713235e9.30.1789483611807;
        Tue, 15 Sep 2026 07:46:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b02211sm325185e9.9.2026.09.15.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:46:51 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:46:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jia Jia <physicalmtea@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, virtualization@lists.linux.dev,
	Eugenio Perez <eperezma@redhat.com>
Subject: Re: [PATCH] vhost-scsi: do not relock event vq mutex on send_evt
 fallback
Message-ID: <20260915104624-mutt-send-email-mst@kernel.org>
References: <20260912090420.47439-1-physicalmtea@gmail.com>
 <20260913090452.2B8221F00893@smtp.kernel.org>
 <CAJwVaMKtk=PxFq330K8NBLRF7FzgcSu32vt1irLEJ7dSRQ5A_w@mail.gmail.com>
 <20260915070050-mutt-send-email-mst@kernel.org>
 <CAJwVaMLsAcRt609Wmz=G-G3j7xDj5+0QK-Ck2ko1pcwerMeb5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJwVaMLsAcRt609Wmz=G-G3j7xDj5+0QK-Ck2ko1pcwerMeb5w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MOCRFT9NtnGZQuKRFMa867p8hmlunW1yhbiNKLCTa0o_1789483613
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 09:30:27PM +0800, Jia Jia wrote:
> >
> > On Mon, Sep 14, 2026 at 04:38:57PM +0800, Jia Jia wrote:
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > >
> > > > Pre-existing issues:
> > > > - [Critical] vhost_scsi_do_evt_work() accesses vq->iov[out] without verifying that the guest actually provided an input buffer, leading to arbitrary user-space memory corruption.
> > > > - [High] Events are processed in LIFO order instead of FIFO, which can cause state corruption for hotplug/hotunplug sequences.
> > > > --
> > > >
> > > > commit 05830c30fc2e4dc682c270a9b487ae5abb66218b
> > > > Author: Jia Jia <physicalmtea@gmail.com>
> > > >
> > > > vhost-scsi: do not relock event vq mutex on send_evt fallback
> > > >
> > > > This commit resolves a deadlock during fallback event handling when the vhost
> > > > worker has disconnected. It splits event completion into an internal unlocked
> > > > helper and a locked wrapper to safely reuse the completion path.
> > > >
> > > > Link: https://lore.kernel.org/all/20260905005352.1E5B01F00A3D@smtp.kernel.org/
> > > >
> > > > > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > > > > index 4f8c0260bc9e7..42abf18291b75 100644
> > > > > --- a/drivers/vhost/scsi.c
> > > > > +++ b/drivers/vhost/scsi.c
> > > > > @@ -660,19 +660,26 @@ vhost_scsi_do_evt_work(struct vhost_scsi *vs, struct vhost_scsi_evt *evt)
> > > > >       vhost_scsi_log_write(vq, vq_log, log_num);
> > > > >  }
> > > > >
> > > > > -static void vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
> > > > > +/* Caller must hold the event virtqueue mutex. */
> > > > > +static void __vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
> > > > >  {
> > > > > -     struct vhost_virtqueue *vq = &vs->vqs[VHOST_SCSI_VQ_EVT].vq;
> > > > >       struct vhost_scsi_evt *evt, *t;
> > > > >       struct llist_node *llnode;
> > > > >
> > > > > -     mutex_lock(&vq->mutex);
> > > > >       llnode = llist_del_all(&vs->vs_event_list);
> > > > >       llist_for_each_entry_safe(evt, t, llnode, list) {
> > > >
> > > > [Severity: High]
> > > > This is a pre-existing issue, but does this loop deliver events to the guest
> > > > in reverse order?
> > > >
> > > > The events are added to vs_event_list using llist_add(), which constructs a
> > > > last-in, first-out list. Because lnode is retrieved locklessly with
> > > > llist_del_all(), and the iteration happens without first calling
> > > > llist_reverse_order(), the events appear to be processed from newest to
> > > > oldest.
> > > >
> > > > Could this cause state corruption for hotplug and hotunplug sequences? For
> > > > example, if a device is plugged and then rapidly unplugged, the guest might
> > > > receive the unplug event first and the plug event second, leaving it
> > > > erroneously believing the device is still present.
> > > >
> > >
> > > Looks like this could get the acquire order wrong? Need to verify.
> >
> >
> > didn't look into this yet - did u reach any conclusion?
> >
> 
> Already reproduced this using a test program. To hit what Sashiko AI described,
> need multiple vhost_scsi_send_evt->llist_add (at least 2) before the
> worker schedules
> vhost_scsi_complete_events(false).
> 
> I personally think this is not very easy to hit, first this kind of
> hotplug/unplug event is not very frequent,
> even if there are multiple calls, as long as the worker is idle it
> will run vhost_scsi_complete_events(false)
> quickly, so pending is often only 1.
> 
> So to reproduce, I created multiple LUNs, and concurrently called 8 ln
> -s (only triggers RESCAN,
> no unplug, extra LUNs are just so we can see the lun numbers better).
> This increases the chance that
> vhost_scsi_send_evt races in before vhost_scsi_complete_events(false)
> runs, so there are at least 2+ pending llist.
> Finally when vhost_scsi_complete_events(false) runs, the guest sees
> the later-linked LUN first.
> (before testing I thought this needed a lot of SCSI I/O to reproduce,
> actually it doesn't)
> I only tested plug, the guest did see add LUN order reversed.

okay... so llist_reverse_order ? Will that fix it?

> 
> > > > >               if (!drop)
> > > > >                       vhost_scsi_do_evt_work(vs, evt);
> > > >
> > > > [Severity: Critical]
> > > > This is a pre-existing issue, but can this function access out-of-bounds or
> > > > stale memory if the guest provides an empty input buffer?
> > > >
> > > > Looking at vhost_scsi_do_evt_work() in drivers/vhost/scsi.c, the code uses
> > > > vhost_get_vq_desc() which populates vq->iov:
> > > >
> > > >     head = vhost_get_vq_desc(vq, vq->iov,
> > > >             ARRAY_SIZE(vq->iov), &out, &in,
> > > >             vq_log, &log_num);
> > > >     ...
> > > >     if ((vq->iov[out].iov_len != sizeof(struct virtio_scsi_event))) {
> > > >         vq_err(vq, "Expecting virtio_scsi_event, got %zu bytes\n",
> > > >                 vq->iov[out].iov_len);
> > > >
> > > > If a guest submits a descriptor chain with only read-only descriptors,
> > > > vhost_get_vq_desc() sets in = 0. The out variable holds the count of
> > > > read-only descriptors, meaning the first writable descriptor expected by the
> > > > host would be at index out.
> > > >
> > >
> > > This is a dup -- an earlier patch already fixed it:
> > > https://lore.kernel.org/all/20260904005240.502787-1-physicalmtea@gmail.com/
> > > It was while fixing that earlier issue that Sashiko spotted this
> > > adjacent problem.
> > >
> > > > Does the length check above access vq->iov[out].iov_len without verifying
> > > > that in > 0?
> > > >
> > > > If in is 0, vq->iov[out] was not populated by vhost_get_vq_desc() and
> > > > contains stale data from a previous request. Could a malicious guest use
> > > > this to force the kernel to write the event structure to a previously
> > > > legitimate but now hot-unplugged host virtual address via the
> > > > __copy_to_user() call later in the function?
> > > >
> > > > >               vhost_scsi_free_evt(vs, evt);
> > > > >       }
> > > > > +}
> > > >
> > > > [ ... ]
> > > >
> > > > --
> > > > Sashiko AI review · https://sashiko.dev/#/patchset/20260912090420.47439-1-physicalmtea@gmail.com?part=1
> >

