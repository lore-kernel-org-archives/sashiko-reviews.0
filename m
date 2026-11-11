Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426709;
	b=flXy+xO5WpVzdWK6pEbHG4+VyGbVKtmg2Hq2nEMuCeF4WvU6Erl52Bh529XCC+swkQWB
	 cA67Zpugcg4VkG24oV6zgW7p/T0tWdswFftOcqRLe22UJA2+/Taqpkh7Ur9/H2+cSbN1U
	 SRX09UDfF0iKqzJCM87U0P6TSnlpE4feVH/FOlIZqfUcXBOmHoOsQp7DaAmKkkRFlwt4e
	 ZID9Wsf6rkcyqcG6SL9q24JxCBIQ/YyirGDexCNOOjdcu8P2r7D6QseRauzH9ZLImXdPk
	 dMHHWl++cE21HVH0bH04mfiyckanz2Hshaqnlhuxc3dIMOMCtpTMyeDZ7NAp8V5Mkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426709;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=13YqSnIhjrSGBdnncrmkRLcLAqs3gUqrk+ICDgkhd5A=;
	b=xRv9Bx4yz5HBHQlCOvu+okKw3Ezn9vTblyz3nZR8uybiEo4M3ojFbDB7BZDvB04aERjU
	 ZBwmMwNbjDROCl6iotu0Enk9oWLbtINPbmL9/4p3KBHeIJPaockwuZ6xkxIz6gGKDnliT
	 wUjeKcjY3zNUk0HmEbszwa9Y/VNFdfYoE0kNvxzX8HOVzxTZNteBvHC1B2PCyDj5G+4x4
	 gIJ/mM2YRCsP3aAOcZA2FJbHowB7rxsCYPQAW5NeT3RpvfGb9BSNrpPRelfvy1lhfA7qc
	 C0C1whcvdLlLJnHSu+Tg9x4bhtG6wqSZZCGCW3cLA4eM0Vv0DPtnwbdeFWjtfiYnuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bR14ee2s;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18A606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB18A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bR14ee2s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794426707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13YqSnIhjrSGBdnncrmkRLcLAqs3gUqrk+ICDgkhd5A=;
	b=bR14ee2sTML+z8wHq+6wWOLy8acuyvOGPOTb7ymXIohTEedoRiq7I33vrSuCCJeWEAnloe
	yw6BaEvmvrlspRVpc+BkEpEG54PALjZk1UXOBR7aBvta9q/ZmWT+VoZ7dBE5jTLb2vFQ7I
	+OruPCCkxPjCWcdpEtf6x2TXYYBlkDQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-3Iiy3TwFMl-g3WVuKZLCmg-1; Wed, 11 Nov 2026 14:51:46 -0500
X-MC-Unique: 3Iiy3TwFMl-g3WVuKZLCmg-1
X-Mimecast-MFC-AGG-ID: 3Iiy3TwFMl-g3WVuKZLCmg_1794426705
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c25edb54d22so441399166b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426705; x=1795031505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13YqSnIhjrSGBdnncrmkRLcLAqs3gUqrk+ICDgkhd5A=;
        b=tLZg3vG7aC9IawF99NQO0XVbqHCstRNSivdCLyXz2BR5Pd1FEo5N976zVM7JoYd8rx
         MQtarJqBpmF+DxLFLOTtKKWfegFgNvN9ZWREFOJpJFH5MLlKJ3P7gzSVX9CLkVp4X1Vl
         cam/seXnPByqRWEUTXup7/rSk3IM+7924ycX9Hm6Dlv450gQInanjFU/UqWNYVWDhKRG
         w9mAKdWatNnayVe6911XdRsX1c5x0P7hS3nnGEM+bUidFTSwwNXs6g1oNIqC+rkC434L
         naEePAtRktgWPQ9ndku5VTkUMZkKKH290BlqrNUz+z+VsKj9wknM8LB5p/lhqAkj62ry
         ZvDw==
X-Gm-Message-State: APuU4Z8Sx7SJ862QyjsTuEx20GtyM158SvRI/jMswzLC9sPpCq4aHGWe
	Zng/epb562o2EMyXz7IcY7Ps2Eftn4mZASTEJntFDecL1qZBFA822KH4Yj5TS4PAw1x/skKld0a
	on75kJYDRzxyn1PKD8ob4XzOeNvULvWPmRUjOwbNojuKWjB2it2YQQSCVcbEbQHsZepbRJ+e7e3
	CrpT2jpilIVMyofOf35zCK2z86u9rXWGxHrqoURNfTQUrPdUeOUaWDvtc=
X-Gm-Gg: AYBFou2Ju6GP69YG5TP1W5nX+xSHxZTYILi788TQcNDxtOUfuP3bECBMBHN3beE7SAR
	7HhSdlrRP4GqzcXiXgmUjOoRgv2Gi+gnjvGmcdifXPo0cFMDzd0332Xo9vwvuzWxRSFO72MV+tL
	OgOi/5qZvvLRhTkdnbIDScNpImhMfwr3UtqMRBRpBWqjEoCS4Ky3sVxgaOmNRCMMbwNgIzvHkDJ
	yemdU8G3JKGCf5hy23MTuVvAUgvscGaX2bPIMMAk5GiCA==
X-Received: by 2002:a17:907:ea8e:b0:c46:ca3a:10d5 with SMTP id a640c23a62f3a-c5066cc8684mr274077066b.45.1794426705289;
        Wed, 11 Nov 2026 11:51:45 -0800 (PST)
X-Received: by 2002:a17:907:ea8e:b0:c46:ca3a:10d5 with SMTP id
 a640c23a62f3a-c5066cc8684mr274075766b.45.1794426704946; Wed, 11 Nov 2026
 11:51:44 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111152057.59798-2-jeff@bencteux.fr> <sashiko-outbox-209282@kernel.org>
In-Reply-To: <sashiko-outbox-209282@kernel.org>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Wed, 11 Nov 2026 16:51:33 -0300
X-Gm-Features: AclHuK-8KRi28-wO7lCotvLzx3R8YClP1yWzaHbkuRqhTMvlvvdXcMtNFCDLN6M
Message-ID: <CAABTaaB9zXgaM2uUMQ3h4nc0rERCDf1_OmSR5mfkxid3bFFNfg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: add missing syscalls to signal class
To: sashiko-reviews@lists.linux.dev
Cc: audit@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VWbbTshX96KsXh1JMBZD5p-Fn8v6ohIjCR6IoyayFlw_1794426705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 1:36=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > The pidfd_send_signal(), rt_sigqueueinfo() and rt_tgsigqueueinfo()
> > system calls are missing from the AUDIT_CLASS_SIGNAL* class. It seems
> > to be used only in kernel/auditfilter.c to increment the audit_signals
> > counter.
> >
> > This counter is used to determine if information related to a target
> > process of a syscall audit rule using signals, such as its pid,
> > should be logged (e54dc2431d740a79a6bd013babade99d71b1714f).
> >
> > Information related to signals sent via these system calls are
> > currently not correctly logged. The current patch adds it to the
> > AUDIT_CLASS_SIGNAL* class.
> >
> > Signed-off-by: Jeffrey Bencteux <jeff@bencteux.fr>
>
> Sashiko has reviewed this patch and found no issues.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111152057.59=
798-2-jeff@bencteux.fr?part=3D1
>
>

Looks good to me.

Reviewed-by: Ricardo Robaina <rrobaina@redhat.com>

