Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634815;
	b=m54zlLsiUJ+yH5Yj+XXJAvuydoBOJvssWgQX6IeIcR2GNV/jphZ3jFRc6e/eMnJDx/yM
	 GENOezpl3J1nX+/AE3hCiphMhhhJG6YiqA69dnRpfwM/sYndOqXPih1AJbgggvW6EvoaG
	 DyKgDd+jYb19ErTV+84BYjL2Y6B/qTawF3xEu70MpdHj5hDjQEJZHlyeAA4v7pZrirH20
	 5Z/9xPxUsa9vY65jATFGapfTdPe1UOVW9LyjnRNvWHaS0smL21bp47sodc3Yq2H9cfZWr
	 nNGQCj4EFVV/k7VYXPtHBdRGKYh5RBLRh7UPyvcSFlMmFnvxWR2INVvydRYo4VhSRcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
	b=HuPuWKNaXZcwJ5YgRiRvs1Q8/FwuvvcW9QSe+I9uMubq+7H7ex0sYWs4KJOmYMH14KHf
	 H6v71/feHZwsFZgohJ9bLw+LSPliGb6U12Zpa0nOMjWz90xsar2Hb9k5JXn+2CGz1kMK6
	 0c4XJFbIaxkOo6ygMoZjxoILHNCylTfXGJgnEpYf+vMAkvjJNZAyCICXTIdr36Mkqzjnt
	 s0WCxhSJTpIYEOgKYWIgTa34SOyN1W6jDLgamQL6SRmeJU0QCltSgtb9xDspZeCXApjee
	 BNLFYZySBChX1FRJ3d6PsovtKrepoEE+bsSAsJKprHyATUB5NvyPRPiBvBFRqy7bBnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nm5TEwvf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621160B4245
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 15:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E621160B4245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=nm5TEwvf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a1947498bso1845407eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 07:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634814; cv=none;
        d=google.com; s=arc-20260327;
        b=KiR+MoVlmFAwdgjFah5hlM1GBkLH8Tuey2RNLq//vZEftpJzl35lk6Ay//Z5O0nnmZ
         BX9v/NLhLS4wted67l5yAenJmx8+/mnv5Ra4nElVqoKrlat3sQCoRWDeIrq24jKNqaIc
         xMSyobdUJ8giebO9AAg22wQnOGCWZrlJqnC8IGl9Hlls3/pgzaIFA6oWYWRrMQDB4+3x
         CLghvjucHQSwZrbAjXYt3CMpXmHv/7SkcpfkyMOMNRfIBvcCBDCqsjFQd/5WX9EuaJC4
         5R8ClAt/M+N5P2uiX7fP+uGABT9hRvrIpGQcYLSKWeriJn9nXFrpLKcMvJOzRzZQhlTA
         F8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=Gu3DQHb5lOXWepTMaJ8ms0AoZzLFJgd+XwYgsALJnmOLq5JKd/Sv8JEUzxKoehxq6S
         Folrkrs2SVBxUH/44Z0XZn1g+RTcZJ9kTI0nqdlF69SBgbrDghsEROHg+9+cbxOftyWl
         QA1X25ATyoK/sbkHilnSCVjlrOLWGXBZBfI9hKgClf9D12tXcMj+z1OQSGP8VO7tSMp5
         WjEZhMSRe2w6hTzfYc/zMVI11VKXPEJOul3qjsGGx+OrJBpfe46Bkvc4YsdWuBsCtsjT
         xXak9ZUO9hDEW5YGcDfmoxQ3dcdJDM4l/wCzF0Gnu5PP1fWmUViOmoX19+koiYQVgCwt
         xG9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793634814; x=1794239614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        b=nm5TEwvfxITZJRrFQDSu7rLkwdhh8gL8RS+P67b3bxOHNHdfuAsJxp19HtUhj6Td2H
         zXgeyyD/gC8Y5T7jOz/jQsQFXO5X4pT9DlyAJX/jJZFW/EjqMS+CZofhNI2QCGW0/IaB
         uUgazGCsSaL/dzWL5AJOkHL1d2nA/7EqNYNn95ebh3w1avCvMW4GTT9Z4VwE1vIw0qoM
         yZ74kQl28xrJrN+ayAEaIuVP5+BhEnI250tdPnZAcmcsmg50LNS3NivtgnJ0mulY5AIs
         r+pbV1KjHVzqc5HW0jICfGXO3WnYQcM+YcyDTZP/qE8fthVTnEsZICGWpjMrZeUiHLAo
         qRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634814; x=1794239614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        b=Z+3GuJ4somRyxoPISH8RgEnze7iqVfytqGwZwD9LXWgOBKcg5yW4XKCux87+EPuLR2
         aTvj9Q0usw4iYxmHeA4IDxMCC8R2AYiwFNagh5QlIV5/MrPuiJoRU8+E+EqkxI2LCeYV
         osQ2joxNypNbxT+gQ5NyOKG8eL6BnqC8BgX2FGBfJoFPNnJ616viZLBefwJJmBytc7ay
         R+jE8V85Dt0NTdA1YiOBp1pARy3/qvi4eRjeD6pTwu65UvKkAjuPc01rK9zJbTHk+MzG
         Gqe+NnxgclNw1+brXbZxkI6RaxBMQqNWFtSVNOAqeaznxULZxE1ifDD8zV6vHOzY3pej
         JFRw==
X-Gm-Message-State: APuU4Z9aVWRUQMW4VEXB7D7h4gv2d6uAV9sodPn1JmG7Pb6D3S7nTC9H
	ikOpwSbZuxFXQhleDC4WGTxxbIEWg9UdlJ9vRCovEeC9hSj3HV4GLRXqrtLn4nnGP3mVdBV/mBX
	Rquhe72Whlrc1I464yLojmllDqymbZmhh7YKZ8mBUvXJC8A+fwE4mO634eA==
X-Gm-Gg: AYBFou2FzdoV5CumeQMNfxQrbbrU+n4iC9mSSvUuQf5xSzvZwZ9fMU3szNNiTtNpP4E
	TrST+VesSy78HpMPh0AH0ynL/bnykeZXG7FT3SLK4ht7Te7NOhpaXyty3A1059Kn4m6Aq7M1WzE
	l5vF0GIwdVumtycowzpkx1YeqqsVHzkNkedcceaDTsw6NYDAgUVTCcF0kvlRZB5/iSqprqWnCvC
	muhEUXv4wuOPfpVw+dQ7vpq3G7wP7sK7r//8eDEF6wcRv6OahmSEECqixsFZ1+AFxuWm4ELAyPu
	N3M+Ogqn4tn+2+nxrzLdYO7xIwXyjQe8PK+LsxW2P/SnrudJ7oK/sl8sPY3FhWMmaUlaggTwOm+
	PgHRKf/RCbue3vdgLg+YLr4pjsYL7X1YivK0b9sBLv/goB9EuKTXiI1gtmMOJ/XPax0ehRw==
X-Received: by 2002:a05:7300:7a8d:b0:369:fe4c:b48f with SMTP id
 5a478bee46e88-36a420583a6mr13496102eec.0.1793634813255; Mon, 02 Nov 2026
 07:53:33 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net> <sashiko-outbox-193554@kernel.org>
In-Reply-To: <sashiko-outbox-193554@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 19:53:15 +0400
X-Gm-Features: AclHuK98Hd8EV1zzuP9BPO6AEe0T1OXHvThx527c48i3Mv-cHoWW_7qC6eEuJW8
Message-ID: <CAKTNdwGTEA0_MKsXNpqYqsZneSuVmt6uJhV0mjwS8=gdobaEsA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] usb: typec: tcpm: SOP' Not_Supported in tcpm_pd_ctrl_request()=
 halts discovery
> --
>
> commit f5763c417e2367d11a45635b9af7ac9ca073d24a
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: tcpm: Complete discovery when the partner lacks SVDM support
>
> This commit marks VDM discovery complete when a port partner responds to
> Discover Identity or Discover SVIDs over SOP with PD_CTRL_NOT_SUPP,
> avoiding an infinite loop of discovery requests.
>
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index d721baef52104..e21fe544b2d4b 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_por=
t *port,
> >               case SNK_READY:
> >                       if (port->vdm_state > VDM_STATE_READY) {
> >                               port->vdm_state =3D VDM_STATE_DONE;
> > +                             /*
> > +                              * A partner without Structured VDM suppo=
rt answers
> > +                              * discovery with Not_Supported: there is=
 nothing left
> > +                              * to discover, just as after a NAK.
> > +                              */
> > +                             if (type =3D=3D PD_CTRL_NOT_SUPP &&
> > +                                 rx_sop_type =3D=3D TCPC_TX_SOP &&
> > +                                 (port->ams =3D=3D DISCOVER_IDENTITY |=
|
> > +                                  port->ams =3D=3D DISCOVER_SVIDS))
> > +                                     tcpm_update_vdm_discovery_state(p=
ort,
> > +                                                                     V=
DM_DISCOVERY_COMPLETE);
>
> [Severity: Medium]
> The commit message notes that a Not_Supported reply from the cable plug i=
s
> left alone so that it cannot cut short discovery of the partner. However,=
 if a
> cable plug replies with PD_CTRL_NOT_SUPP (rx_sop_type =3D=3D TCPC_TX_SOP_=
PRIME) in
> tcpm_pd_ctrl_request(), doesn't leaving port->vdm_discovery_state unchang=
ed
> still stall partner discovery and repeatedly re-send the SOP' request?
>
> Specifically, after the partner ACKs SOP CMD_DISCOVER_IDENT, tcpm_pd_svdm=
()
> sets port->vdm_discovery_state to VDM_DISCOVERY_PARTNER_IDENT and probes =
SOP'
> before discovering the partner's SVIDs:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
>     ...
>         tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_IDENT=
);
>     ...
>         if (IS_ERR_OR_NULL(port->cable) &&
>             tcpm_can_communicate_sop_prime(port)) {
>                 *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
>                 response[0] =3D VDO(USB_SID_PD, 1,
>                                   typec_get_negotiated_svdm_version(typec=
),
>                                   CMD_DISCOVER_IDENT);
>                 rlen =3D 1;
>         } else {
>                 *response_tx_sop_type =3D TCPC_TX_SOP;
>                 response[0] =3D VDO(USB_SID_PD, 1,
>                                   typec_get_negotiated_svdm_version(typec=
),
>                                   CMD_DISCOVER_SVID);
>                 rlen =3D 1;
>         }
> }
>
> If the cable plug replies to SOP' CMD_DISCOVER_IDENT with PD_CTRL_NOT_SUP=
P,
> tcpm_pd_ctrl_request() finishes the AMS without advancing
> port->vdm_discovery_state or queueing SOP CMD_DISCOVER_SVID. Because
> port->cable is still NULL, every subsequent run of tcpm_vdm_discovery_wor=
k()
> will re-send SOP' CMD_DISCOVER_IDENT instead of moving on to partner SVID
> discovery:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_vdm_discovery_work() {
>     ...
>         case VDM_DISCOVERY_PARTNER_IDENT:
>                 if (tcpm_can_communicate_sop_prime(port) && !port->cable)=
 {
>                         tx_sop_type =3D TCPC_TX_SOP_PRIME;
>                         msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_IDENT);
>                 } else {
>                         if (tcpm_can_communicate_sop_prime(port))
>                                 tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_CABLE_IDENT);
>                         msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_SVID);
>                 }
>                 break;
> }
>
> Similarly, when tcpm_handle_discover_mode() finishes discovering partner =
modes
> and sends SOP' CMD_DISCOVER_SVID in VDM_DISCOVERY_PARTNER_MODES, a
> PD_CTRL_NOT_SUPP on SOP' leaves port->vdm_discovery_state in
> VDM_DISCOVERY_PARTNER_MODES without calling tcpm_register_partner_altmode=
s(),
> causing tcpm_vdm_discovery_work() to repeatedly re-send SOP'
> CMD_DISCOVER_SVID.
>
> Should a PD_CTRL_NOT_SUPP on TCPC_TX_SOP_PRIME fall back to SOP discovery=
 in
> the same way vdm_run_state_machine() handles SOP' transmission failures i=
n
> VDM_STATE_ERR_SEND (advancing to VDM_DISCOVERY_CABLE_IDENT and queueing S=
OP
> CMD_DISCOVER_SVID on DISCOVER_IDENTITY, or calling
> tcpm_register_partner_altmodes() and marking VDM_DISCOVERY_COMPLETE on
> DISCOVER_SVIDS and DISCOVER_MODES)?

True. I've simulated that with two TCPM-managed devices on two ends of
a dumb Type-C cable, with one pretending to be an e-marker in addition
to a partner, and this patch does indeed put them in a SOP'
CMD_DISCOVER_SVID loop. This takes a non-compliant e-marker though.

I'll add a precursor patch to address that at the class level, and
send it as a mini-series after waiting for any other feedback on this
patch.

Best regards,
Alexey
