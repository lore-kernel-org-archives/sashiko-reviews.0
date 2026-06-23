Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C8346E56
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225392; cv=pass; b=eWH6K1k4TOFaSaC4TZ6OGXERn4B6LwRqrdwh+5gsXC8sZB4EUPVD0Ipf0c6mmEz6xcm++YVoBCcu2HVyAsV3zjXwV9yZer3+RM+GWMkWOU0wjRV1ERODzlmLhP/5V6xC+88Oaf/pEWfXzk+4pJ58MZCU19osZ+lsLBmODErqg+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225392; c=relaxed/simple;
	bh=/3EwYVse55XcLg2zXjtfzrzJAQ2yCF8sQYzT3W5N7/Y=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsCFqvzqumFh1SV2D9rg+OdP3cNeb/ANazF9YFZ1F4zxnI999XKYBonU1XwbziUMEhX25++ddHjYuXoy0Fc9fPff0Kj3kdLMS1TPLAwHCWwdzWb//h9uDezt8qVEihUYQpj4p1OPEdAg2UVRVEphx7AdOAkwE17v2A/oN0XYb+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UM6Vc7yb; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UM6Vc7yb"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139a5f4ca15so4502917c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 07:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782225389; cv=none;
        d=google.com; s=arc-20240605;
        b=kOTuoFnDHcPK/ccOq3qJADxIAJuB26fRTWi79jm79tvjtvFf2Pm1+pt/Fc96b5xdfK
         gXHWRpO2jZtVzv0DG6vQ7XfGozDPkPuUdlWg4ewnzsQTW1odJTK7bCL2pF9ikfR8rg3t
         7kQPmSK//I6w10wxySCoi88CnRV0zsaHlmuXR+Z0rGTpC4oAi7/o7Tvq5lElXaEmnVhk
         KtC+HZioIpnkZVyYQW1Zh2myq1jR7EyOLZqKloac7nYd3ah4hFBs8m0GHQpFGecC+k/C
         z9tjGj6brt26TkqCIeygiZ9N1P+Z/GoszOe74sZ6cb4zfb5cfhRU7CWUC7agFJiSsd/e
         MQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=vJgphXJdnNJlLlw3xwPgUoTcSpATvUHMKFRtOKS6dyU=;
        fh=oQKl3z1YuZQACL71AjnmcQxoL4FYVaXJJeOF6RdgwfQ=;
        b=YsOWcWcj4UqNE5AsFWtaXFaKLswDBXge5ApJY/K0YUHmzHNnGH9egKCVUa41BE2O+p
         bPXDK2lcG6iOUDor7orXMnivEEtj3yaQK88Il75+NDMY3iRjvQ54XzeUTPTzgu11p4yh
         K0n+wn3fHbtePgzVF/eATXr6MqEMnxFagS8nvwHWLlVDiimdbfVLwsl140w1LZLWAnWW
         UAOGwn75IvL2+NTLqQtPyzqcFosR1iHte3/WEXD8mLybVbNGPlzGtEa3Wci0SAktyAYP
         4g/i6HDoROQz2duaZmuCeEtVa3awimN9mLQtHX1NduFiMmBmtLLC0cf7YcO8KA13Tsis
         dxvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782225389; x=1782830189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJgphXJdnNJlLlw3xwPgUoTcSpATvUHMKFRtOKS6dyU=;
        b=UM6Vc7ybEA4w2JIAsLnYySClzkr28KG168ODwDBvAvGlZn38ZLzlEP4KdlpBxdIV2V
         x950FdkEfFfOBMaL7xGMbpXvs2i9dTlN9G9oegN2buraDy7d3SUysEWLMLFISFbVg9x/
         df4NfWAIMirIiMCSGa68L2q3N++m6Ge5/L9rhk9OmhWz0KT8fjY1MCx1/CxkW9ngN3lK
         iiQjrJQ0PQfW7oeB7b0DpuWpi3NjIV+U818xhJZkjVSgK3JRGVY5fxtRNrcunq8OcOvS
         DB/NxFRCmFOnma8IlwlexxSa7JU6MQg6dImORc+DHxTzNvUPvHz4/vH6gnnCLaCJ/l/t
         VdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225389; x=1782830189;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJgphXJdnNJlLlw3xwPgUoTcSpATvUHMKFRtOKS6dyU=;
        b=JYhD5bmilg/fgTtp/xXaYcS57r7LQeRArwuSghWqLzW5FKtJ2MkyEuoX20EJ1OuXMX
         QweyfnlP6cy7o4EqV34Jc4SiilwSBAd8DMEUDyyRMksISrUfy13lSKt43WEH561JJi9y
         yt35DPnXnMzL+UJ9yvzgNfoJQtkPg6OvINp5QiFLrc0DEqwf14/qr+mbEwuDTdV7Q+54
         m6K+7cEQ9LUIuK2TORC/gXfUBpjdm0F1ojINCYTPBfa8tNMGJSXmPvgE/lGXqnyTK89W
         qKHMgqTC3L61+YUHGuwew5LZE2qbv9Uo+2Ip+Px6QQjFkrsdy5xLDpoewEGiSbqjnd6u
         axeA==
X-Gm-Message-State: AOJu0Yykn00+kkjFUbTXgm/JmzP9FwRmHoGrXQpx2oDFkpRHe+CQxO/6
	mGAuMBZrYV65eWLHA3A46zdYXNnGhjEF32D2gV5h8Qpo5+wHzlETsZi88OJTOWRaPAom0ZPHlIC
	tqfWgLBGYpCWq4SJDzMAiQh9dRLX6DGbmuxe8Cnz9xy6rMv5WoKGmebNL
X-Gm-Gg: AfdE7ckljhTevqN52Gq/HhdL7bvCrz9ConGRGBumwbzZd51a9oyYk3H9A0Du/lTDhgX
	cUpyNjqphLukqJep/ELxyIJcE4oGOEqfUE6K4YPudX24uPwNs5CIaj+iCe2jleZtKXHV197y3gQ
	4K1hw5sgT97+l4uSzwvGV29Fd2jvYmD5z42VeVciOVKQtk34XNQd2MsRLkNcBK8lUo+buNsBK6W
	iM+CV2Pmw7epX69xPZzf0oLb6SoSHxvppyWU5dsAZiei3DQS3YCZfk3OwLbpn1hCAJKZf1GLmYR
	OsEaL4dRuX2iFyiIq1RcaPhst9l+
X-Received: by 2002:a05:7022:2204:b0:139:7f71:9ce8 with SMTP id
 a92af1059eb24-139a3456498mr9963525c88.0.1782225388222; Tue, 23 Jun 2026
 07:36:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 07:36:26 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 07:36:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260623093335.3C1F91F00A3A@smtp.kernel.org>
References: <20260623091556.1500930-1-joro@8bytes.org> <20260623091556.1500930-5-joro@8bytes.org>
 <20260623093335.3C1F91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 07:36:26 -0700
X-Gm-Features: AVVi8CfVMQhPCLdKi-Kz2N8bfv78RoIZSO1YpQwS89D-4s2CIn8OJqjaOGeR-hw
Message-ID: <CAEvNRgHy9m9RZzu21Un6rNh6iQs55xVjiFZw-Lou9ES3cjqc_Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] kvm: sev: Acquire a writeable page reference for
 CPUID pages
To: sashiko-reviews@lists.linux.dev, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>
> [...snip...]
>

Thanks Jorg, commit f13e90059908 ("KVM: SEV: Pin source page for write
when adding CPUID data for SNP guest") is a combination of this patch
and the previous, so this is fixed too.

This report caught my attention:

> [Severity: High]
> This is a pre-existing issue, but is there a data race and use-after-free
> risk on kvm_memory_slot between memslot teardown and kvm_gmem_error_folio=
()?
>
> When KVM destroys a memslot, kvm_gmem_unbind() fast-paths the teardown if
> there is no file:
>
> virt/kvm/guest_memfd.c:kvm_gmem_unbind() {
>     if (!file) {
>         __kvm_gmem_unbind(slot, slot->gmem.file->private_data);
>         return;
>     }
>     ...
> }
>
> This deliberately skips acquiring filemap_invalidate_lock(file->f_mapping=
).
>

Here's how kvm_gmem_unbind() relates to kvm_gmem_release():

This unbinding without filemap_invalidate_lock() covers the case where

+ During VM destruction, the memslots are being destroyed:
  kvm_gmem_unbind() is reached without holding slots_lock

and

+ There's a concurrent guest_memfd kvm_gmem_release()

slot->gmem.file is not NULL (yet, kvm_gmem_release() would set that),
but the file is already closed, hence kvm_gmem_get_file() returns
NULL. (See CLASS(gmem_get_file, file)(slot);).

Since kvm_gmem_get_file() returns NULL, there's no way to safely take
the filemap_invalidate_lock(), but we must still do the
unbinding. Without unbinding, kvm_gmem_release() would iterate
f->bindings and use slot after free.

> If a hardware memory failure concurrently triggers kvm_gmem_error_folio()=
,
> it iterates over f->bindings holding only filemap_invalidate_lock_shared(=
).
>

To get to the above unbinding without holding filemap_invalidate_lock(),
the file would have to already be closed. If the file is closed, the
inode (and folios) can still be alive. Memory failure can look up the
folios and hence the inode.

But to reach __kvm_gmem_invalidate_begin() from kvm_gmem_error_folio(),
we'd have to iterate the files associated with the inode
(kvm_gmem_for_each_file() in kvm_gmem_invalidate()). Since the file is
already closed to unbind without filemap_invalidate_lock(), the
kvm_gmem_error_folio() side won't see the file.

> Because xa_for_each_range() drops the internal RCU lock for each element,
> could it yield the slot pointer right as kvm_gmem_unbind() completes and
> frees it, leading to a dereference of freed memory here?
>

No issue here. Phew.

> virt/kvm/guest_memfd.c:__kvm_gmem_invalidate_begin() {
>     ...
>     .start =3D slot->base_gfn + max(pgoff, start) - pgoff,
>     ...
> }
>
>>  	if (count < 0) {
>>  		argp->error =3D sev_populate_args.fw_error;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623091556.15=
00930-1-joro@8bytes.org?part=3D4
