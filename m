Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541474;
	b=5km6CY95Sk/dRiAd24Erzkv7eMc8gDVsV5eLmQg2fOg5u03ISVbwP1kgDA4SC4JBd0D0
	 WOZZrHugcQMrWEYkgP3dyMsvXBJzKeE/6mILFWv/8OxZkcdX/O5y28ZUnTPnhkfaD9tOa
	 VmtmtlfHZMJblHxXsjHNMowzYcX8qe7wjBpAtixxoXKCvj0aopdUOZ94+RQLbmYj9kuY9
	 40Q3QDn0+gcV01M2R1AyIfj9m74LMio46CxEUGdUenzaLpkCb/D5hdxTt3NA6nf/k3f5g
	 FWZrJ9EQmhcqRfnya2CiMf6YjtgB7q+M382/izJ5Rz4IA3EEqtzKiIqfVqexyoTOkMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541474;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Date:In-Reply-To:References:User-Agent:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=RpUbfWxz8pPyPWO3yv7OZsnOJtxcXvcFltLPgKWaHpU=;
	b=YTDOf44S/AaBXGYEqrcyn8ejWDXrtDprOg/lrZz7316PNakO6jY6qiYu4ZQ83/06UiqA
	 IQj+WdQFvZN3onzBqir7YiMFXQfmBz20WbZ9EKA+DptetqCYdu6Myf76OogA+H4ac+l8F
	 s58xmuJlYFnY6xpJx2Q/VSjl3aK3nq1JjWOJ3kTMf8tycf0XWiFafV/Q2jVN+8InjsXnc
	 FdsAMzrd4kVXMFYuePt7/mSz7W3o1wkJstiaRl3tkZN0ArVpi3FBaHE7v1HmnrOm6HKvB
	 5vgKZfmmkaIKJT4urjCZs41PktLUsF4rP2uks67anSdGA3314QCwTxAP2HIIVyiE45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JsW4r4lb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05457606A326
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05457606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JsW4r4lb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795541473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpUbfWxz8pPyPWO3yv7OZsnOJtxcXvcFltLPgKWaHpU=;
	b=JsW4r4lbhPeV6l7bWZFQtrEqVTH1tdobrOH+bTwCF2r//qLnTuYjQhu4O6xKBsxDULDHsS
	BaTA2DJVZru7TbIhTbMGi9nOBZlIbD/P+eiY6O3w2YW7PBtzRFlYRROSSG2w7bdokx1QjL
	AYL1KlAgeUmVbX4KXLk2pE70ILD0GZE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-qyBA0qP9PH-TgqgrLq3oAw-1; Tue, 24 Nov 2026 17:31:11 +0000
X-MC-Unique: qyBA0qP9PH-TgqgrLq3oAw-1
X-Mimecast-MFC-AGG-ID: qyBA0qP9PH-TgqgrLq3oAw_1795541470
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so512012585a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541470; x=1796146270;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpUbfWxz8pPyPWO3yv7OZsnOJtxcXvcFltLPgKWaHpU=;
        b=KtRYtyqzJCa0f6vx++7lTAa6SGwKEbKlVwNatEpqdvtmWsd/0YCKdAJsh6nUVB781V
         KAW7u15inOQIZyzCz1rVwcMjLOCI1pr2O9csJunvJmM51ku22WIK8Gp+ENkhzIRooOJ4
         YMAq6+LVlpfeuiGlmBMQifgEH3yIDmrUKMhLvyxEChQti5kgDfDcoBe7PT8fYpmsLvBL
         nMsBKlPh1T7I4V1u8fgq+xBBM1WZL1oXaYLqfrfMax217EqEIuIBBI77PWYsDEiHfW2g
         4gljggsJBGaINVyc7Wut8FQaJSy3lO0w3aUeqy8yTMDgKCMxo6ftWd3LpFga9i6EuMRZ
         eX+Q==
X-Gm-Message-State: APuU4Z9ZwJMe/bgFBjpsEAHZl0EAcwbEEPD5J6ks7OLlv5OV/q1aT7m/
	EgXjDptaC6KU0MEKh1LgkmU26SzIHlaPyS67uPzUX9+OfhuaFIy8r7dF8V1OkHnXFxpc7Hl4Apm
	KVj0rxpR+uhiIXgmTbUk/AzHb2n+iAXZG4bjH+hm8fX00qC3oRiiQw+u3MqIlyB+TQS5548oZZ1
	f2TRQa89G53yOiGyjpAjSSpFday0knL2+8U96eL+a5zSmihNmXsMIONg==
X-Gm-Gg: AZFdTZdsL2ahmThg6uBz8I7Srm3oEV9qhwWU8VV0pNN1SlOwxCqNgITpsiWCPgLFPAL
	0iW0Rb/NgQ60g9EdcGXms2NO5RZ7TUuyI1axyRHkyYLRih/Vdksfh/QWXgO4pggYAimY/3Qj1WR
	DJiM4oZgApfy0iID44iCMZL+l5x8A/kNKGOe9afmaacqy6hbdtqfuFwY71Myp+onS2RZNcVf4Wx
	P5EBPCNEfPXz1f3bw0Zn+jGb+4Fzh/pPe6hzeaCFDYrzLNhOoxnKKuScZeyCAiU8zx35VGQP1CS
	1Q0s5xlHOW78UQjkfhkUz6CZltGI4+G0tzQ71zyYOekat00aOU6MR9dxNB8Iy9qseCjdG9w30nG
	zPzeEqzbQsIOPCySme+bq30nzK4lMdmoZQmPaOYjM6KJ8X7oX+Oz8vQQTxKnWwSyrJYBVhlEfBf
	XwsZ5Yk5o=
X-Received: by 2002:a05:620a:6485:b0:949:a71d:af14 with SMTP id af79cd13be357-949bab5548cmr2338609685a.66.1795541469955;
        Tue, 24 Nov 2026 09:31:09 -0800 (PST)
X-Received: by 2002:a05:620a:6485:b0:949:a71d:af14 with SMTP id af79cd13be357-949bab5548cmr2338605185a.66.1795541469382;
        Tue, 24 Nov 2026 09:31:09 -0800 (PST)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb ([209.103.33.216])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb35005dsm1093771285a.11.2026.11.24.09.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:31:09 -0800 (PST)
Message-ID: <810dca21de79ae1df524c45d920933d8e2e1915f.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] KVM: nVMX: don't check PIR.ON when processing
 nested posted interrupts
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Date: Tue, 24 Nov 2026 12:31:08 -0500
In-Reply-To: <sashiko-outbox-229790@kernel.org>
References: <20261123175512.80438-1-mlevitsk@redhat.com>
	 <20261123175512.80438-2-mlevitsk@redhat.com>
	 <sashiko-outbox-229790@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atOJaaNdCBjKvCcoJpGO64UP-cDtsXV0GFASf1TGxM8_1795541470
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-11-23 at 18:02 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] KVM: nVMX: missing Fixes: trailers for nested posted-interrupt
> =C2=A0 PID.ON checks
> --
>=20
> commit b99242cc2d5d177888bd387559bf392b46fc1d67
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> > KVM: nVMX: don't check PIR.ON when processing nested posted interrupts
> >=20
> > Despite the suggestion to test and set the PIR.ON and avoid sending
> > a posted interrupt if it is already set, there is no requirement
> > for this bit to be set for posted interrupt processing to happen
> > when the target CPU receives the posted notification vector.
> >=20
> > See section 30.6 POSTED-INTERRUPT PROCESSING:
> >=20
> > =C2=A0=C2=A0 "The processor clears the outstanding-notification bit in
> > =C2=A0=C2=A0=C2=A0 the posted-interrupt descriptor. This is done atomic=
ally so as to leave
> > =C2=A0=C2=A0=C2=A0 the remainder of the descriptor unmodified
> > =C2=A0=C2=A0=C2=A0 (e.g., with a locked AND operation)."
> >=20
> > Apparently Windows' implementation of APICv does exactly this:
> > it sets bits in PIR, without bothering to also set the PIR.ON.
> >=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> [Severity: Low]
> This fixes nested posted-interrupt processing and wakeup checks when L1
> triggers the notification vector without setting PID.ON.=C2=A0 Should thi=
s
> include:
>=20
> =C2=A0 Fixes: 705699a13994 ("KVM: nVMX: Enable nested posted interrupt pr=
ocessing")
> =C2=A0 Fixes: 27c4fa42b11a ("KVM: nVMX: Check for pending posted interrup=
ts when looking for nested events")

Makes sense, I'll add this.

