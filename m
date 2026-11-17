Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916892;
	b=llZvTGtQWRTU+bhd6JhJlt063X0RNgiS3E2+t9PbDpLYIc/h+guRrFtgqMNGVkGuFOC6
	 er4Zx6zcRxRhFPkW6DHe+E45vN69wOtoRXSlSupZQrgNE81YIFg1zde4HIWeUXlMV+bbi
	 /tPc90fC4GUWOcsW+O+PYk2tzJA3S7KGSYFP3aWd4ROnKQ25urS1wcGWCycXrZH2m+oEZ
	 T+FnuuKxOdWoEq861ouiH3ENX3wPKF8gpQnZX6VZAS52f3MONRQJ2THoNg6wNkxchel4N
	 tKmbwAyNKxko7lrYteIJLCTFG7nDAb5zSOyILM4CLH48ro1PBg5EX0bR5/qylcslQLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
	b=reelQkMhBT1DdoRQYTQy/NOzLuSTcOkMPPYXh9zghOOQy730roueB1JOA+UPm8Z3UKfE
	 Qiu1swCrI10UtTfvQimd+wkhQWDLe9cC5n+ivnRIXFnvlczuO4r0cYejpzThtZ/6GQj5Q
	 mFfwV8sLHPJxC3EamC3YqbHGturAXkk1RJ0FLazQ6JsQeDWaeR94t1TjSXK7VVQLe8ye/
	 2pE+FDslhTsQEk0vxRWt/ZNah+DjmyOP5awNtvHNxi0ycKj5NsEy9lCk3I4RyPpQYAb0c
	 3HHBtwOUw+NBieP4GdS9wB/fbNZRaBMEkcr88qfy5cvUCT9ykuZB6ljXEJzLqWbOERQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=djDYDsXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAE606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=djDYDsXj
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d21051042so272818566b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 04:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916890; cv=none;
        d=google.com; s=arc-20260327;
        b=KB5UOEki7yCDHAO+KVptYPce8sRRzx3cM4a8avgJldDJo5ajMD1YmyJ9hvGiio4L57
         0Qn2V2NJfcF+DRRo5JIxQ/JxsCdx63b8vc6K0DqOw6CvHPsh+yckkAnZ911+J3T6eaVI
         /ELgftkzKU/TkC3dF8H304DWErcHrL8MoCQmPus9vfycqlbHLgHjIpjmZdAPUwFQjVxA
         CQe9T/TI6fTmDu3CPWCCJlZhosDfQnBb0yMnhb7ABXrTOR4+yEdvdWaarHe9dldK2Xf3
         jLtkvbpDLFTfw18jlJ+PKIhnQ3K+hhkeKJ1N3XykpPEMablr9A7BVHT+jUnab3XQWtQp
         RPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=R0UKji6YPaGnwepMGNOgzbPdP/i9L1OJ0sFJZxRla0+xdgpCi6NOA7CFazgeGWEw8v
         KfN5HO68rckNyWfi/uR8M8RlfYchAIy8l3dHof5JlJSenx2I8l0nd8CZl2nhYVUzvbm5
         gG7ZicA2jt5eg4aeQh0WXagZBc4YciGvr+WQRUYsV1sVIdCrxG2LCVL0jlILRrlWeemI
         eDWyKWUZyPAag47yt29IFCvY72idxdLj6IYSUdZoIj7hkHnvtNuw3WIKrTPzIUbA+4kR
         S475K6XiXrYYFU22kuaO4GehFf2bDNamGz/J2clMKCzWv8H64ZY0dV4+/XPHNJn5zQxc
         KOHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794916890; x=1795521690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        b=djDYDsXjWGYmjqqLUt21tUGJ14gQEp1BuECOikVKLnNKUo9YWAdgVUNCrqoMPSkKnr
         GDoBSP0ylHXfeRjTW39/sILf1/U4vby9Zzs1vz6pS1rWYIgtVOEnZ4rn+CN+PJZFWawi
         /0jVRKbEro0RIGrjBLUNtScSRWo2NuJx+MbL0lobzLCJ0sY4kMmf0+JoCkjVhF3v8g/1
         GQpy3iCkITdXAxGzeRc2/dxTJMFrrnEdRTFGXwGvwZ5RC/riqwsTFaAvIFIoO8S9Frh9
         D6ViHrOiboX5OupTBxtVMrfpz7xGEVOyOlNyQ6O5k4s8IluSnvLgr0GdNPWpTQ7NEf+p
         stWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916890; x=1795521690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        b=vDFbK1MkfJXy1BV6CEJD7n24gzfKFmJtIxlChCGJXImmDgBg5AgYeMY624FT7G5wjk
         qghaF86xIDOXWeahPG0rkuXnkshN/yDl5cNrFQZF93Q20k4tMGT9XN5NK3vuvkwxPbLa
         ds5a7PJ25k/rpBLlWlsr+aa/soTecefqr4CRbpvMwFCfpWGpRXtoin585MV0NTeJeH3v
         ghr2ixjeOu98JeIFh0ZOUZi/hOveAFecuXFYz+KjGdPJ6qMBBBMsUyJEVfw8ixq4AMz2
         oizMnsC5h3qiButp6ti2YSfe4JQLvUqotIgPItta4/41NZGzH0cmio8XSgb3CiKnTz4o
         hPPA==
X-Gm-Message-State: APuU4Z9Iq3OE/boKltKsnUwVPIM0qfWZexBSRMUbORyyEPg0jkJB6cVI
	8HnAOVRtndl6/vP7ZgYd6rUS7jexeam8UspiWA+AKem3KEPCWjTYkAGJHeujrlm3onCFWgcPIki
	z2mNTinjSQwQ8Lj7y8gKQ06pTmOXFEc5+3zcq0RmRBUOSrpCa4ngkXgU=
X-Gm-Gg: AYBFou0VXzKg1kV9AkSiROhHkqGAxe0wO6MvOHxtyULaQKMHPVJpa4eDVAuZaOnOzM7
	XHvxbPrMmEp0HguyiosRo8YFkeR0drEfkN9SbeP362+cpkncxwQ4cLOaI2wbicTULUoCEQVy+st
	9MlBPfgYLbFOpIp2kPl4xdIBpX1oX47jYNNi07+PCfG2k4fSKXZHEM+XxXq/CH+U/rjlKD1jLhy
	kRy/CA9BAcJyEYB63vZiyPSU5M9s2TPhaFLNLEoQNSG+vCvJjH6RKl727cUIl2GeAeVFmO6/c0Z
	cB60bwkcADjh41OVSlk5HVmG1lrXs4TZEtBdrXmjZYTfh+sRzVGOJ09zMCH+qgJQkHNoDS04E+D
	pUgnArMkZhdqKgLP5ETQt3bjiJQtGTFPFhkq8RYJEld/55qJnuz3t3NqVjfBBMgu2uQCh6kx94t
	Wgo/GC53VWjqMhB6A=
X-Received: by 2002:a17:906:f59c:b0:c42:102f:15f0 with SMTP id
 a640c23a62f3a-c509614d4c1mr1061020966b.3.1794916889480; Tue, 17 Nov 2026
 04:01:29 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-1-c7e1543828c0@flipper.net> <sashiko-outbox-218712@kernel.org>
In-Reply-To: <sashiko-outbox-218712@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:01:18 +0400
X-Gm-Features: AclHuK9zyk3sN3vYB_U05kdu-HfgPLCLfSCbrpw3lIrpG_3_fsGrO03RmZX3p2g
Message-ID: <CAKTNdwGh=7JLbn7y4qJK8BxfvcczgZPebBF8XSiMrZGKa7cE-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Keep the Soft_Reset target apart
 from the VDM one
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: typec: tcpm: stale upcoming_state in run_state_machine()
>   sends SOP reset
> --
>
> commit 2100338173ee82724a16da9e2eef51514fc95f54
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: tcpm: Keep the Soft_Reset target apart from the VDM one
>
> This commit splits tx_sop_type into vdm_sop_type and soft_reset_sop_type =
so
> that VDM transmissions and Soft_Reset messages do not overwrite each othe=
r's
> SOP* target.
>
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index bb90211660cae..8c5be904d7725 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> [ ... ]
> > @@ -6220,7 +6225,8 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                * A Soft_Reset Message Shall be targeted at a specific e=
ntity
> >                * depending on the type of SOP* packet used.
> >                */
> > -             if (port->tx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> > +             if (port->soft_reset_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> > +                     port->soft_reset_sop_type =3D TCPC_TX_SOP;
> >                       port->message_id_prime =3D 0;
> >                       port->rx_msgid_prime =3D -1;
> >                       tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TC=
PC_TX_SOP_PRIME);
> > @@ -6439,7 +6445,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >       case VCONN_SWAP_SEND_SOFT_RESET:
> >               tcpm_swap_complete(port, port->swap_status);
> >               if (tcpm_can_communicate_sop_prime(port)) {
> > -                     port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> > +                     port->soft_reset_sop_type =3D TCPC_TX_SOP_PRIME;
> >                       port->upcoming_state =3D SOFT_RESET_SEND;
> >                       tcpm_ams_start(port, SOFT_RESET_AMS);
> >               } else {
>
> [Severity: Medium]
> When port->pwr_role is TYPEC_SOURCE, can resetting port->soft_reset_sop_t=
ype
> to TCPC_TX_SOP in SOFT_RESET_SEND cause an unintended SOP Soft_Reset to b=
e
> sent to the port partner right after the SOP' Soft_Reset finishes?
>
> In VCONN_SWAP_SEND_SOFT_RESET, port->upcoming_state is set to
> SOFT_RESET_SEND before calling tcpm_ams_start(port, SOFT_RESET_AMS).  Whe=
n
> port->pwr_role =3D=3D TYPEC_SOURCE, tcpm_ams_start() transitions directly=
 to
> SOFT_RESET_SEND without going through AMS_START, leaving
> port->upcoming_state set to SOFT_RESET_SEND:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_ams_start() {
>     ...
>                 } else if (ams =3D=3D SOFT_RESET_AMS) {
>                         if (!port->explicit_contract)
>                                 tcpm_set_cc(port, tcpm_rp_cc(port));
>                         tcpm_set_state(port, SOFT_RESET_SEND, 0);
>                         return ret;
>                 }
>     ...
> }
>
> Once the SOP' Soft_Reset completes and the state machine returns to
> SRC_READY, SRC_READY consumes the leftover port->upcoming_state and
> re-enters SOFT_RESET_SEND:
>
> drivers/usb/typec/tcpm/tcpm.c:run_state_machine() {
>     ...
>                 if (port->upcoming_state !=3D INVALID_STATE) {
>                         upcoming_state =3D port->upcoming_state;
>                         port->upcoming_state =3D INVALID_STATE;
>                         tcpm_set_state(port, upcoming_state, 0);
>                         break;
>                 }
>     ...
> }
>
> Because the first pass through SOFT_RESET_SEND already reset
> port->soft_reset_sop_type to TCPC_TX_SOP, the second pass takes the else
> branch, clears the partner source capabilities and SOP message IDs, and
> sends an unintended PD_CTRL_SOFT_RESET on TCPC_TX_SOP to the port partner=
,
> forcing a full contract renegotiation.

This is handled in [1], already reviewed by Heikki, and also tagged
for stable, just as this patch.

[1] https://lore.kernel.org/all/20261103-husb311-cable-comm-v1-1-6217dabc1a=
85@flipper.net/

Best regards,
Alexey
