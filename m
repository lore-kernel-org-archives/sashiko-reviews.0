Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC722B8DF
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518335; cv=pass; b=YJzjnuoSvqmpUwpYwCwUpgJwkOiDYtXzRDj46OKUF2bEXkwV6RYF8yT/DiAL04V0bfS6jRXEHb43S9ckQrRecJMvdS9fGti+VkEbT+2KZvmjq8b2U6tdglYTFoj+Cck/gY6N0ZzYNBckshehDvunZWs2gVY8HIFltOVVSJMmm6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518335; c=relaxed/simple;
	bh=I1znuk91gTt78a/SYP5tvHEKRhocY11O1JMDs5bzSXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Silgr8wr0wy1ZXXHSoJYaxOpZtYxPbwrWSuKkM59nLFBuKn6wbIyQPqKwu7CH3KzGDZiLClhufEaOCvZe+BEds/LiVFkgTAYpZC1T2QUPENxrFZKvz30ENgm2BhNIkpe/fEgaCKhNvUbuTkBngCCB89f69LfS2UDFANxC/uHxSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc7c3M6X; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc7c3M6X"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939922847efso35940385a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 17:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789518332; cv=none;
        d=google.com; s=arc-20260327;
        b=sSrxR2/bdQrJ5FMGC3gkBDeYWoVPi+BIJCaghY5tpnqONb/Roo9nwUVDovqYfP9+so
         5QaMgSF3XiuRLq/IuD7zGEUuNCASzsdGagDBWyXSYLLLr9g1Skpi9hUAq49GXDkBQIxY
         TcEE9rZX3TtjBBvCxOoSDYujhGI9abFV3SifvGktYQb8anKmAVdLYksVowRTgKlOaRnR
         BTxxfDQIkcUA543p2Xielc+eTRtXKcHRAPT1lRrG/wc30Wa9pEqiPmilwLWNFYp3t6hK
         rN5Hoiy8PKWHK5Nwe81fWscdmj7dY+VCsxWuTNq1oGpzRA/pbMxxKK0qS2Cxi3qTn6/L
         G4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egILxrt7497R49XkLTZpGyuz1OxWUBmXgNnG8hVd/k8=;
        fh=g9Oe5K09T9jBWfPrqkUOZ1y6/7GSsyXSECS6xWWN14g=;
        b=HzwLhhPq4frlAyNB2TTK7wo2RFO822onT3BLsgba6SNMA2ZVMt5zDdTecy6uVAAaAB
         UFT5gw9aTO5TlnIdTFQDgFnBhai+dVniefQUKrYdbFDcx25uB8i4CYIhEfHIwIlzhzso
         VzOkSVMzwIpTWl5bzefTsNX7GT9NbmBwpmy2km3U4yUzo/5coi272zDqcqSpYj0g4PB0
         OUGLz9oEuGxQyRsUA1ILeoxdiZQ93+qv1N44lKwp41USZIeSs74JWDXzGwDei+1vYdHP
         mXWndTVjKkAeBRQ5kTb3X/XixLXcHLV5igIqRvSwDT8pR2XvZJURDDXg2K0kPkhBaqKJ
         w6EA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789518332; x=1790123132; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=egILxrt7497R49XkLTZpGyuz1OxWUBmXgNnG8hVd/k8=;
        b=Zc7c3M6X9zWy/TNTcuaCvBLBNJ5lmoJy57tLh8zjy4BGk2fbJ7D6+c7L6vQgbwerxH
         ZU4tgfk41Gmhy8vEOZ/W7EWW7hZftQSUa7gw1J8n/Bco0IN2cOBtyF4BfR9VP/zBT0NY
         UZs6eJWy4WMaAZKj70LT3rvd1lVH4Bm8UTHB6a1AvHfj5ezEYnoZ9YTzbpDQwdSSVzsT
         n/Uy01eFqEEBP/eCaL17AsAoGAHIvo3UsrO2/pH6kdayU36LmAM/RoJe3QTCeMBMM5Il
         kQ+ERp969gGxYMIqHRtnIOFSAPq7UmRC+bPUOcjF7YHlUa/F/s/ZhHnmZ+eyHnFVF5yV
         1uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789518332; x=1790123132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egILxrt7497R49XkLTZpGyuz1OxWUBmXgNnG8hVd/k8=;
        b=2SeViK7uxFQyoRBtPh+HslzK4Jq0XHXjJ27yM3jbpsip+tmHg75eX/3EaEGHpIP6SM
         LYLnKhb+h8y/7ztCX0BiFp65fng8Cf0jyph321UJMGoD+bUEarmQD8+pbZLee2gfb9Ol
         WE0S40ANtKgJJlcz/0koYgWrhwaK2ZtujNrxkCFbRz2gsOM0vuldZbI8/S3A0Fm81Huv
         FfqJmYxeZpKQrxqnyWOkNmR0kdE3rpt1eXhRSXvx70KMqpEIjcPKlIARYx45D9HEop27
         RAqZPRGtYk5xSYyCv1FUX0B25xTo2NyHW750KPmU3I0ppavoRP++JYqtwVSRsV00PZAb
         xCow==
X-Gm-Message-State: AFuF++k/HuhkrtKiiwSUEfpKPqwBLM0xjzYcM0NeuIoFypfJHqjNyACQ
	6Td0Ltv7WK2lw5hAmNEMdgKu12lYqf5t9MWPd4lArGXbBc12feUVrSJkdraryIuLZ6U7wl/QckU
	FgmvQ7kPEiCPktD4bvc4X++6PWFvJYCI=
X-Gm-Gg: AYBFou3sEBnGj211ozT3eVerHSrgz+2ilg01qYrk65uWFQwOBgO5YKMx2dgpEeCs0dP
	CKfXjJxKR/CMRR/GplCs84fn2hWqPFyue2EJcXbmpj12aLRDVEZ3F1XzSejNv65ZODXSoLQteng
	gH91ynQyjr9ouOsRiFK59NaDXtfU6aXgsDxQi0F86SpBtsCyZ1SLP74vcP9jHDHQ2nIsY5BQJIA
	DuZA2sUDSP336Ru2cCDU0bYGuX6PzU99NFzox2j/OImlnNyX82Qw48r7Tq68+wrOxlA4dvSSi1t
	lTxEBVDaJ5fN1KuIAP2zuIfq65oE6l47/EVMBN3BwegXJRdgE/DNoJg=
X-Received: by 2002:a05:620a:8007:b0:939:733d:cbe0 with SMTP id
 af79cd13be357-93bb7667ff4mr91255085a.3.1789518332464; Tue, 15 Sep 2026
 17:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912090420.47439-1-physicalmtea@gmail.com>
 <20260913090452.2B8221F00893@smtp.kernel.org> <CAJwVaMKtk=PxFq330K8NBLRF7FzgcSu32vt1irLEJ7dSRQ5A_w@mail.gmail.com>
 <20260915070050-mutt-send-email-mst@kernel.org> <CAJwVaMLsAcRt609Wmz=G-G3j7xDj5+0QK-Ck2ko1pcwerMeb5w@mail.gmail.com>
 <20260915104624-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260915104624-mutt-send-email-mst@kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Wed, 16 Sep 2026 08:24:55 +0800
X-Gm-Features: AcwNN1V-WeD8Sd0h2yfWlqcWI-ihJSC7pPFUtM4CZJ7fBjotTYMGQmapjvZvFjE
Message-ID: <CAJwVaM+zrvo-AqwMuKB2a4CXtjT9xw_o0AURGwKtepUdRvnuzA@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: do not relock event vq mutex on send_evt fallback
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, virtualization@lists.linux.dev, 
	Eugenio Perez <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Tue, Sep 15, 2026 at 09:30:27PM +0800, Jia Jia wrote:
> > >
> > > On Mon, Sep 14, 2026 at 04:38:57PM +0800, Jia Jia wrote:
> > > > >
> > > > > Thank you for your contribution! Sashiko AI review found 2 potent=
ial issue(s) to consider:
> > > > >
> > > > > Pre-existing issues:
> > > > > - [Critical] vhost_scsi_do_evt_work() accesses vq->iov[out] witho=
ut verifying that the guest actually provided an input buffer, leading to a=
rbitrary user-space memory corruption.
> > > > > - [High] Events are processed in LIFO order instead of FIFO, whic=
h can cause state corruption for hotplug/hotunplug sequences.
> > > > > --
> > > > >
> > > > > commit 05830c30fc2e4dc682c270a9b487ae5abb66218b
> > > > > Author: Jia Jia <physicalmtea@gmail.com>
> > > > >
> > > > > vhost-scsi: do not relock event vq mutex on send_evt fallback
> > > > >
> > > > > This commit resolves a deadlock during fallback event handling wh=
en the vhost
> > > > > worker has disconnected. It splits event completion into an inter=
nal unlocked
> > > > > helper and a locked wrapper to safely reuse the completion path.
> > > > >
> > > > > Link: https://lore.kernel.org/all/20260905005352.1E5B01F00A3D@smt=
p.kernel.org/
> > > > >
> > > > > > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > > > > > index 4f8c0260bc9e7..42abf18291b75 100644
> > > > > > --- a/drivers/vhost/scsi.c
> > > > > > +++ b/drivers/vhost/scsi.c
> > > > > > @@ -660,19 +660,26 @@ vhost_scsi_do_evt_work(struct vhost_scsi =
*vs, struct vhost_scsi_evt *evt)
> > > > > >       vhost_scsi_log_write(vq, vq_log, log_num);
> > > > > >  }
> > > > > >
> > > > > > -static void vhost_scsi_complete_events(struct vhost_scsi *vs, =
bool drop)
> > > > > > +/* Caller must hold the event virtqueue mutex. */
> > > > > > +static void __vhost_scsi_complete_events(struct vhost_scsi *vs=
, bool drop)
> > > > > >  {
> > > > > > -     struct vhost_virtqueue *vq =3D &vs->vqs[VHOST_SCSI_VQ_EVT=
].vq;
> > > > > >       struct vhost_scsi_evt *evt, *t;
> > > > > >       struct llist_node *llnode;
> > > > > >
> > > > > > -     mutex_lock(&vq->mutex);
> > > > > >       llnode =3D llist_del_all(&vs->vs_event_list);
> > > > > >       llist_for_each_entry_safe(evt, t, llnode, list) {
> > > > >
> > > > > [Severity: High]
> > > > > This is a pre-existing issue, but does this loop deliver events t=
o the guest
> > > > > in reverse order?
> > > > >
> > > > > The events are added to vs_event_list using llist_add(), which co=
nstructs a
> > > > > last-in, first-out list. Because lnode is retrieved locklessly wi=
th
> > > > > llist_del_all(), and the iteration happens without first calling
> > > > > llist_reverse_order(), the events appear to be processed from new=
est to
> > > > > oldest.
> > > > >
> > > > > Could this cause state corruption for hotplug and hotunplug seque=
nces? For
> > > > > example, if a device is plugged and then rapidly unplugged, the g=
uest might
> > > > > receive the unplug event first and the plug event second, leaving=
 it
> > > > > erroneously believing the device is still present.
> > > > >
> > > >
> > > > Looks like this could get the acquire order wrong? Need to verify.
> > >
> > >
> > > didn't look into this yet - did u reach any conclusion?
> > >
> >
> > Already reproduced this using a test program. To hit what Sashiko AI de=
scribed,
> > need multiple vhost_scsi_send_evt->llist_add (at least 2) before the
> > worker schedules
> > vhost_scsi_complete_events(false).
> >
> > I personally think this is not very easy to hit, first this kind of
> > hotplug/unplug event is not very frequent,
> > even if there are multiple calls, as long as the worker is idle it
> > will run vhost_scsi_complete_events(false)
> > quickly, so pending is often only 1.
> >
> > So to reproduce, I created multiple LUNs, and concurrently called 8 ln
> > -s (only triggers RESCAN,
> > no unplug, extra LUNs are just so we can see the lun numbers better).
> > This increases the chance that
> > vhost_scsi_send_evt races in before vhost_scsi_complete_events(false)
> > runs, so there are at least 2+ pending llist.
> > Finally when vhost_scsi_complete_events(false) runs, the guest sees
> > the later-linked LUN first.
> > (before testing I thought this needed a lot of SCSI I/O to reproduce,
> > actually it doesn't)
> > I only tested plug, the guest did see add LUN order reversed.
>
> okay... so llist_reverse_order ? Will that fix it?
>

Yes. After reproducing I already sent another patch:
<20260915094244.7900-1-physicalmtea@gmail.com>

> >
> > > > > >               if (!drop)
> > > > > >                       vhost_scsi_do_evt_work(vs, evt);
> > > > >
> > > > > [Severity: Critical]
> > > > > This is a pre-existing issue, but can this function access out-of=
-bounds or
> > > > > stale memory if the guest provides an empty input buffer?
> > > > >
> > > > > Looking at vhost_scsi_do_evt_work() in drivers/vhost/scsi.c, the =
code uses
> > > > > vhost_get_vq_desc() which populates vq->iov:
> > > > >
> > > > >     head =3D vhost_get_vq_desc(vq, vq->iov,
> > > > >             ARRAY_SIZE(vq->iov), &out, &in,
> > > > >             vq_log, &log_num);
> > > > >     ...
> > > > >     if ((vq->iov[out].iov_len !=3D sizeof(struct virtio_scsi_even=
t))) {
> > > > >         vq_err(vq, "Expecting virtio_scsi_event, got %zu bytes\n"=
,
> > > > >                 vq->iov[out].iov_len);
> > > > >
> > > > > If a guest submits a descriptor chain with only read-only descrip=
tors,
> > > > > vhost_get_vq_desc() sets in =3D 0. The out variable holds the cou=
nt of
> > > > > read-only descriptors, meaning the first writable descriptor expe=
cted by the
> > > > > host would be at index out.
> > > > >
> > > >
> > > > This is a dup -- an earlier patch already fixed it:
> > > > https://lore.kernel.org/all/20260904005240.502787-1-physicalmtea@gm=
ail.com/
> > > > It was while fixing that earlier issue that Sashiko spotted this
> > > > adjacent problem.
> > > >
> > > > > Does the length check above access vq->iov[out].iov_len without v=
erifying
> > > > > that in > 0?
> > > > >
> > > > > If in is 0, vq->iov[out] was not populated by vhost_get_vq_desc()=
 and
> > > > > contains stale data from a previous request. Could a malicious gu=
est use
> > > > > this to force the kernel to write the event structure to a previo=
usly
> > > > > legitimate but now hot-unplugged host virtual address via the
> > > > > __copy_to_user() call later in the function?
> > > > >
> > > > > >               vhost_scsi_free_evt(vs, evt);
> > > > > >       }
> > > > > > +}
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > --
> > > > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202609120=
90420.47439-1-physicalmtea@gmail.com?part=3D1
> > >
>
