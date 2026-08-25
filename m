Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7A393DF9
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660050; cv=none; b=QRlU77s3nYdPx3BorrENmy3ODCRnDLGsfL0813ZJaOSyvK2aXz/9UdFIYuU1dlhQu085+iDv38fR9HYbeg3ZbP0GlVgPsniOKXZzRDBBLAuRA3ZlDCkzkisqirXJrFy1L/j1CEBVm55mJJ7IQltlwmBeXu+C2g4GjbBwSJIdIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660050; c=relaxed/simple;
	bh=NVbkKI6QFsXk17rOg7lcPfRf5F+RTbGPKucUVaamswM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NgII8j6kKSUBCIYoQHjKo3kPN6atWufx+xmK1/IckknZLzFRHYm4TKp4AOUDzOjJ0zmtuiw3oWQC1uxpkQnIFDtm+B3rPGJX5S9RAnLj/k/GwrnIeRbGMfe3ygWYrNoG7O/2pA83tCPwfoEIMK7suPMNE+mtrY6p9fGDpcdqcnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hor/xZB/; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hor/xZB/"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so6468855a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660040; x=1788264840;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB7RDS/L44/MrXoSm7Y3WAOETyxE7JFt48XjjgX9L7c=;
        b=jrOEdksUjt8/6kMzapnBwHxL/OX3zlIejDy3RFpPgF7aowBitc/C+JAey3gZRsPm50
         qmXtcNFT5AH5Upgajytu94LjcEHSkywZGiPqu8LZN9DI6b65xfGil293JqLkRvhgrwNY
         z45ut+No1mupUYJjUS+UABe4+ZodxABlAdKAekrXBtHWko0cZFce5N3erXHztil3Cg3e
         MvlkWSrYaVPJudzeO7jYCrrCaIvOdZ1evWDrr6uGEArlnRuWpCN0OvKzs0LtPvYbEajg
         v/WNKe6fdUvmmmFQhy3cKzBYQcrJanHioKyPahG+Ut0VGWBWcC+xUmpzSHJs3cTM0gR0
         tBRQ==
X-Gm-Message-State: AFuF++l5mzkJwpSpyS1eJ2YTlrBeopGVr+qKbZ2Rt15ay9tN+q7SHGsU
	zoAoM2SfE84HSphOZj6WNmzGd5QmzTrpL9KhEczeSsdjtTbliTD/FWaTY8XEzSExgxud7riJRAp
	whd1NL+fT28/uFNvu217MMu/HkUffhmp0X40nQrP6nuh0g0Zz+TVsddmOaEqu6m+prWgRAI1+//
	trScZSAQwPOEhxCGuAkP3QmYfwOWYWpHQ8NIOqMm93aWAcxFai6ZE3+aCUy7Nx7g1t7UBaVJNoK
	uLi3bYFJpzYZCCD9YO+XBU+RkcMQ6A=
X-Gm-Gg: AR+sD13fcYmNr1arr+M+tKYXiwrkK81D7HATefnSnEmnoNWpHEXd39DjRLVNHr9QmB9
	/eX1ZVjDlgZMb7xJaqJfGyIVpSnniimSdZrNQNoeaEhmY+1mCmggOGLm5yKcvEGoDw/H+yAxO5C
	M7O0berkFzdOjKlPlGv/uI6VszZpi2gMNCSgcVGMMml40wnX6rNIEQQUqyOaVzsjxih/Q/lnxeM
	SPfextPd0eDy8oj2+0xc3K7LvWNlXRWy5f9z3pumZ+Yr3gF+yew1vfQAsG4nZtgmi4n4JLhXZUb
	88m/UhA3JydeyTUJDS211MfmJEBiGTtNT/coA/defYrrtnSeF2/KBtggxtqOaOKA6HJkjJdbmK1
	YSbVxS4TZ25RDOeoFR0Xk90yejeWVgkSvnmzRvLq+iR/jIri3bh/FIgxbY5oNUHfTzmeEr1zxu2
	F6z/2r5EQ4vhQiERfpv3zxb1j/5qOKSD5JdYcH+OsN/Z587g==
X-Received: by 2002:a17:90b:384d:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-395c3503b04mr55426014a91.5.1787660039978;
        Tue, 25 Aug 2026 05:13:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39645a47fb2sm1328139a91.1.2026.08.25.05.13.59
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:13:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1670dd0f5dso155483366b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787660038; x=1788264838; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xB7RDS/L44/MrXoSm7Y3WAOETyxE7JFt48XjjgX9L7c=;
        b=hor/xZB/Tj6MIU1xUrLFk6SBX/OKw9/N7uSjlroxdw7JFUu2O4iMqFUvIfaOEFApQb
         FP6/YnyR2iT1JejcyW22uKeyWFih7pmqF5JCn00hmo269IHjIGUdXi51y0JJlbtX4P9e
         CYpoI4ZjwXQbUeyHYh0F2Dj8qBKrH7CT3zIMY=
X-Received: by 2002:a17:907:72c4:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c2491e838dcmr3144571866b.11.1787660037802;
        Tue, 25 Aug 2026 05:13:57 -0700 (PDT)
X-Received: by 2002:a17:907:72c4:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c2491e838dcmr3144560366b.11.1787660037107; Tue, 25 Aug 2026
 05:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-11-chandrakanth.patil@broadcom.com> <20260818181045.7CBF71F000E9@smtp.kernel.org>
In-Reply-To: <20260818181045.7CBF71F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:43:44 +0530
X-Gm-Features: AcwNN1UTq6wJv08bfjrK9RzwoxMPphpXriGAnLWliGSFxCINI_cq8Fu9mwi7JSg
Message-ID: <CABvwm=OQ252QjjQP3E7kUCcguzuFpC5DAbFmiCJnpeY4Lf27ng@mail.gmail.com>
Subject: Re: [PATCH 10/17] mpi3mr: Fix out-of-bounds read in SAS topology
 change events
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008d95e20659de0978"

--0000000000008d95e20659de0978
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing bounds checking in PCIe topology change event handlers.
> - [High] Incomplete fix: early return in SAS top-half bypasses bottom-hal=
f cancellation.
> - [High] Event data length is unbounded by host DMA buffer size.
> --
>
> --- Patch [10]: [PATCH 10/17] mpi3mr: Fix out-of-bounds read in SAS topol=
ogy change events ---
> commit bab975c5553e402733c8341f728b4c3f336df543
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: Fix out-of-bounds read in SAS topology change events
>
> The number of entries in a SAS topology change event is used to walk
> the entry array without being compared against the amount of event data
> that was received, so the walk can run past the end of the buffer.
>
> Work out how many entries the payload can hold and skip the event if it
> claims more.
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_os.c b/drivers/scsi/mpi3mr/mpi3=
mr_os.c
> > index b18e7ea873030..1291c60b4d98c 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_os.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_os.c
>
> [ ... ]
>
> > @@ -2819,11 +2819,26 @@ static void mpi3mr_sastopochg_evt_th(struct mpi=
3mr_ioc *mrioc,
> >       struct mpi3_event_data_sas_topology_change_list *topo_evt =3D
> >           (struct mpi3_event_data_sas_topology_change_list *)event_repl=
y->event_data;
> >       int i;
> > -     u16 handle;
> > -     u8 reason_code;
> > +     u16 handle, avail_len;
> > +     u8 reason_code, max_entries;
> >       struct mpi3mr_tgt_dev *tgtdev =3D NULL;
> >       struct mpi3mr_stgt_priv_data *scsi_tgt_priv_data =3D NULL;
> >
> > +     avail_len =3D event_reply->event_data_length * 4;
>
> [Severity: High]
> This is a pre-existing issue, but does event_reply->event_data_length
> need to be validated against the host DMA buffer size before being used?
>
> Since event_data_length is provided by the firmware, if it exceeds the
> hardware DMA reply frame size (mrioc->reply_sz), could this calculation
> artificially inflate avail_len and defeat the bounds check?
>
> Also, looking at mpi3mr_os_handle_events(), this unvalidated length
> appears to be used for a memory copy:
>
> mpi3mr_os_handle_events() {
>     ...
>     sz =3D event_reply->event_data_length * 4;
>     fwevt =3D mpi3mr_alloc_fwevt(sz);
>     ...
>     memcpy(fwevt->event_data, event_reply->event_data, sz);
> }
>
> Could this result in an out-of-bounds read from the DMA reply frame pool?
>
> > +     if (avail_len < offsetof(struct mpi3_event_data_sas_topology_chan=
ge_list, phy_entry)) {
> > +             ioc_err(mrioc, "SAS topology event: event data too small =
(%u bytes)\n",
> > +                     avail_len);
> > +             return;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does returning early here
> leave the bottom-half handler scheduled with unvalidated data?
>
> In mpi3mr_os_handle_events(), the bottom-half scheduling flag is set
> before the top-half runs:
>
> mpi3mr_os_handle_events() {
>     ...
>     process_evt_bh =3D 1;
>     mpi3mr_sastopochg_evt_th(mrioc, event_reply);
> }
>
> If we hit this early return (or the one below), process_evt_bh remains 1.
> When mpi3mr_sastopochg_evt_bh() subsequently runs, it will iterate over t=
he
> unvalidated event_data->num_entries, potentially reading out-of-bounds.
>
> Should this function clear the bottom-half scheduling flag or return an e=
rror
> code when validation fails?
>
> > +     }
> > +     max_entries =3D (avail_len -
> > +                   offsetof(struct mpi3_event_data_sas_topology_change=
_list, phy_entry)) /
> > +                   sizeof(struct mpi3_event_sas_topo_phy_entry);
> > +     if (topo_evt->num_entries > max_entries) {
> > +             ioc_err(mrioc, "SAS topology event: num_entries(%d) excee=
ds max(%d)\n",
> > +                     topo_evt->num_entries, max_entries);
> > +             return;
> > +     }
> > +
> >       for (i =3D 0; i < topo_evt->num_entries; i++) {
> >               handle =3D le16_to_cpu(topo_evt->phy_entry[i].attached_de=
v_handle);
> >               if (!handle)
>
> [Severity: High]
> This is a pre-existing issue, but should a similar bounds check be applie=
d
> to the PCIe topology change events?
>
> Looking at mpi3mr_pcietopochg_evt_th() and mpi3mr_pcietopochg_evt_bh(),
> both handlers blindly iterate over the variable-length port_entry array
> using the unvalidated num_entries provided by firmware:
>
> mpi3mr_pcietopochg_evt_th() {
>     ...
>     for (i =3D 0; i < topo_evt->num_entries; i++) {
>         handle =3D le16_to_cpu(topo_evt->port_entry[i].attached_dev_handl=
e);
>     ...
> }
>
> Could a maliciously large num_entries provided by a device cause an
> out-of-bounds memory read here as well?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D10

Thanks for the review.

New issues:
- None. This patch specifically bounds the num_entries iteration count
in SAS topology change events against the received event data payload
length.

Pre-existing issues:
- The event_data_length check against reply_sz is addressed in
"mpi3mr: Fix out-of-bounds read of event data" in this same series.
- The PCIe topology change event bounds check is addressed in "mpi3mr:
Fix out-of-bounds read in PCIe topology change events" in this same
series.
- The top-half early return behavior and bottom-half event handling
structure are pre-existing in the driver design and will be addressed
in a
  separate follow-up patch series.

--0000000000008d95e20659de0978
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGpzCCBI+g
AwIBAgIMAgfxQ1Z7DrZKmCE/MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEwMzUwNFoXDTI3MDYyMTEwMzUwNFowgekxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFUGF0aWwxFTATBgNVBCoTDENoYW5kcmFrYW50aDEWMBQGA1UEChMNQlJP
QURDT00gSU5DLjEoMCYGA1UEAwwfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTEuMCwG
CSqGSIb3DQEJARYfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAJwyF5qSHwwr1zJWkKvkMnY7V/sVFYYjTpjgxS4XA76pD6eLsZvS
4J73HkKSNEzORxBE7OyZSnuBJ9zeeRcypuItG9YrHm+0OSF0psIWsH15FBYJ0nvsUnlFbCSNvOdr
Co0WJ1KTe/7caj014uRZM2j7zH1vC+9fjEgrJdDRZakZXarl8M7k9okvVj1N+EuHiYUMvsAuMadE
a3p31Z6QdvMpr+30UdJXHshV1mXca+UBpCx26GbY6NgxhHM2LtHiaCK8Vn4HMofDkFg4nQ6eK4ai
uCiTtPj5aNlkdpcCzcZ+j1eCu6ZfPIq2ycwDaHi8d6Dwcgm+XoxDmD97Ehp2FOkCAwEAAaOCAeMw
ggHfMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggr
BgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1l
Y2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2Ny
NnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGg
MgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5
LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKgYDVR0RBCMwIYEfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTAT
BgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNV
HQ4EFgQUyqNnwId/JCbRPslVl3nm48YRek0wDQYJKoZIhvcNAQELBQADggIBAKPmllSh8cRXzNRs
3OATCVDgrdOfIsZMB9UVXcYQ+HtR1fu9bafeyuuupF9gcCmi+onLsANYRKaEDjC8h+V5FMAgm6TI
bww4EFGpWvP/XEVKrpcpMkYNMLw89lagx9ZZDhx9DmfQMI9gG9MPpCkSMEPnJvEs7gqtOo08aL1+
ts10tGfePsHF/I42Da21hJIJ01XN+Z91y//1cJkHwCBvDmoB8gdMXp3g4sjzahTxRZ25BdZB9W+n
0jfWJXFKtp9MYS1SaVo17usfrlTeyaH3zPyDvfAfGoLB5+i8vyVL6wta2vgVpfsL9iwhbJnAIxr+
ljECWkh1weDJw3UnV6nooG1RztnwqbG4eAG/KSCToXgVH9qSDv5S1lve5mvhv9AHzLjGLs+QtMeg
WEdMM4G0PWyibzGgNrmVgKaLjV6EMo/IZW7KjBtvjyKQZhes90D4GyxXv+/mrTo2rruz53+FoSc/
nuyLmg/SxnnZRaf7JGHFvu0IbwkeINwdHynAanOg9AD4zits7k7jjQ0fwIdhCaoRA3ao7PXUL1t8
LfSp/K5DCYsrXNqitPmQaAAGAiG4d4WDxBev6vtoyH7ejLcuCKkxCefrLO5qYnuDHsMNCObdslAe
tMVer+USn6AqB//6EwmqdiLr4o20UQ79jxNFMAEKdwyNkA8mVCVUAtTe3mPrMYICVzCCAlMCAQEw
YjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xv
YmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMAgfxQ1Z7DrZKmCE/MA0GCWCGSAFlAwQCAQUA
oIHHMC8GCSqGSIb3DQEJBDEiBCCWC7DlnV0yN71WpDDaWDCbBtCqgbTDAyN1sHQt3eDybDAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjEzNThaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBCzJJ/cwka
mqEmfwv+wgUhYVXEjynjLzXz3D2BTI8UQfpKOCt/PGd9Yx6cHjd29SzBLi1yfYl0jnw7X+w9rhOj
5Gt2Nhh6IjrjyzCsdVdhf6Ppms9iefPhnhnOkOuAxvy1Kmdm1iPYzAxV1JYMYklG0msuNnk2cGE1
j8WXeZ+ub48FFpCJ9S5RuZ2al6pJvbKBKcEQB4KlSyIqFci4bpHvijPijzbp8zNxgxL5vXwWS3s8
Zn5uCb7fuuRY92KF+5MDptSjfN4cxRZyRcJYsolDos4DcXUuXfMlg8eYY9OXK+os8Zc1phnHJ46N
HRcuQZ8OEY+TPHWA94PgJgQVNjxz
--0000000000008d95e20659de0978--
