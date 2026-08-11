Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C8639A047
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487173; cv=pass; b=PfLknKIYMS1pDqSGigLa2ACdVrh2dl1JPXABnZV+6EZyEV2xCYHV1q2Cs7IeC6Lzwc7VUSQPmSMrUaC3Od0Z5isCaFrtyPnvwZ2Ub2suAGPp4zb2HCkqZgYicWPexbk+/iH9MKEltvrGY6ZtiOIOi+uFgFGapJAA9DK9aMbo0wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487173; c=relaxed/simple;
	bh=zOxTpYwEGrjOIPWvV8eblzzR6Is1CgaWmxeGqUl1ytk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=spsN3qBQBn4txyiqJ2MCiyhAOiPW59ukSk3ETdJrYiU2SAZ/TfTyF++d+Q0k8ZNs8NY33fYl7KKXj/KL7rwSgG2HPuQaoy9h07/VByWInBt7kBpoCDmmBpS/aQYuS17x8V70wWWW5oUI2knTvRyNfxg4ssHxSEWvWIEF9NaHApI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBhcRHcj; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBhcRHcj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso537328a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 15:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786487170; cv=none;
        d=google.com; s=arc-20260327;
        b=pHAuN5E8kZdtDSO25dalaqbpFcDNi+OmM3HHA5jmgnIsIUcS7zH/GTL9O31631WMcs
         BYKLNweHnvbCLC93fNf2HAxGfmsmLw1fnhglipVNFtBcXEYEKWVu5XQVBb2/bCJRtB05
         CLI64vQuDFP8Zkru1EcxB8x67kM3JHJoaiw0Q6wRMDesrdB4p/mKpkskAgBXq4OzS4Zw
         pw38BrnNuxMojf2PXoxKfDgaxfzxVrecuKzG6C6qONfm2rwd0O97bVPHMiAmU2tRjvbx
         k/rkUVrVGlezGfoK69hRAe75rrIyHfQmanGqyjC46C8Pey/8NadgT/sXuIV+kSZvkLd4
         U49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ztwhx/oqFOuHzV2Y1PSljV48Qzv2Tvays7jDKuyMYA4=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=bPMk2Wdm7+tcszZyMP5b+nuynCp+/rtHwzjQ+8dcnhI/bD7dcDdqGO8v/alLPvEGa8
         zazblpQ23IC+c/ubB54O2+rvXqo7z1PiWGft0wzECSbIleHZnJ1TZgqzivTd5xhVVQv1
         ubRvQSjgJzu/SaEiuzIemHVcXTCdwKcp6OuSkT/ahi/zwoVtgU75l2aS0QkNsP5LAZP8
         /tueQVsnnYwFd/PdNMKTZEf0vbmWj7w9AjC3y/AVN/59zPW258112KtPpt5b0yU4CRyA
         yprLfSUvicqFr2vqCI3i7MgrvGcVXouGFpyM8+IS8qhx/UGvL6YhuY0yO52H3B9/8BRF
         TjSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786487170; x=1787091970; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztwhx/oqFOuHzV2Y1PSljV48Qzv2Tvays7jDKuyMYA4=;
        b=ZBhcRHcjRPdeLfGG8QkHjW/CVNtuKHALzP+NL7ADvChIBIR52dLkmZqy1nt8uT6InA
         hcHVB3BDSbFoluEKBYQncpi0UcvGwrG0Af6syPxvTI9pfssHwMUTP1Jewlkg2y3bozXV
         OTY6AbPGVVMHzwA/jMXM0zQGm+9odBu6yhwH/Ctz4MHAVFl8CLMhw01c4fyPzsbVyfn1
         qjclAxWHrKbZsz09D+9e6bYdfL8MtbRTTJ4krtK7ab7QnvRzjwasJYIZB1MH5LrqyJLy
         Q2vaP8P3WP+F4W6LRP0dsPq4LjlXrlHeCs21qB1p7jhktnEMhziwlzrEgDZ1Cp/IFEE/
         8sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786487170; x=1787091970;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztwhx/oqFOuHzV2Y1PSljV48Qzv2Tvays7jDKuyMYA4=;
        b=ZL4IDRRh9KXt6rjTLCnh/gNHdZElXHHd2Ww52ww5ypalteoHrV/mKgmupUAVJ8wzCU
         iqUJDfbZrfL9nsab3gA5lepARPxf6JsXSJYeeK+uehiEAUvDlzE4rUJvi3gykq7FBw7R
         FX2xpKQ5udnIdPjePhy16i17TL7Spw1B04IzN2UA4IWDRuX7/JZu9xP76l/sabjjZGmt
         MG6kEte7bV3rsG9LxmqYMrkj+xfZZ3eunZEyu+5Pcyd9adyCFGFksmZsLHBFcM/FzsBR
         fUvoXvmslY8pVVmK+NOLSE0p5/CGXjxQzlMfU7rEzGmcfZH4tuVfnpqITlZ3B9RvGqxC
         WWTw==
X-Gm-Message-State: AOJu0YzUFI2fI3TOsZZZ5fQX1H8aGGh6JZiOz1SEqD40J/NTmDjSTPnb
	RqpV62sahtnyHLMnyQqt83vTWDDMjObbE134ocQ12dLQEr6KD8XiEF0xQ31LdMNIeh5316W38c9
	yag9p5oT+0YP5vLOaMUMNQnhhc0xl/9CdOuDWJ+2BBlhB
X-Gm-Gg: AR+sD12XYCYCTnE2WsHkQTTasMOz/bd+9PuNwxcCgjykpd/5abzb2WLdtycvRw/KIQR
	kqKPpd+Tw/Gz8qJppJxKvsvmRKyvAnuOHX80MYfg1k7xJ0T3fyNuHG5Ezfa6JWmpcuRL+agT7Ox
	BxQyg//LZzV94gX6LwyRpCxwmm8OZyqTkQseDdBoUMksQBRyqUn6HNI+jEIW5kpNVmp8/Q6g2Jj
	jKu+/bS5LERUU9nPh3YdhO2g2CGTu8bOidPDQ3CYNANfjr50fgwW2enEI/P17mjLo+AIUU1Uv1b
	/MKsViHLOupKk7Pwh42ojlEHB3olQtstqwbCzudTJfZF0X5wxENqW2yHKPibzd/S7OL4rTBrqQu
	RIA==
X-Received: by 2002:a05:6402:a5d7:20b0:6a1:fb46:c405 with SMTP id
 4fb4d7f45d1cf-6a375f5d5b6mr6729a12.14.1786487169650; Tue, 11 Aug 2026
 15:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811215135.87756-1-harshitvaru666@gmail.com> <20260811220809.CBC431F000E9@smtp.kernel.org>
In-Reply-To: <20260811220809.CBC431F000E9@smtp.kernel.org>
From: Harshit Varu <harshitvaru666@gmail.com>
Date: Wed, 12 Aug 2026 03:56:01 +0530
X-Gm-Features: AUfX_mxXY8iQoC5CagJacgyM0bDhEtZRHnNuzSchqdybGAiumvcHcgazmUDO7mw
Message-ID: <CANQf2B1ZSm8uC-c1s91EV6KF5i+eSSAZF+RUZieFDw-k2XZuXA@mail.gmail.com>
Subject: Re: [PATCH mptcp] mptcp: fix uninitialized local_id in syncookie
 MP_JOIN reconstruction
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch =E2=80=94 request_bkup and thmac are indeed read uninitialized i=
n
subflow_ulp_clone() on the syncookie path (not stored in join_entry, not
restored). I've expanded the fix (v2) to save and restore both, completing =
the
state restore alongside local_id. v2 also updates the commit message
accordingly.

On Wed, Aug 12, 2026 at 3:38=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Medium] The `request_bkup` and `thmac` fields in `mptcp_subflow_reques=
t_sock` remain uninitialized when processing MP_JOIN SYN cookies, leading t=
o state corruption and KMSAN violations.
> --
>
> --- Patch [1]: [PATCH mptcp] mptcp: fix uninitialized local_id in syncook=
ie MP_JOIN reconstruction ---
> commit 0b8fe993e0c1f5676def1ed9e644c11a85aca0ae
> Author: Harshit Varu <harshitvaru666@gmail.com>
>
> mptcp: fix uninitialized local_id in syncookie MP_JOIN reconstruction
>
> This commit fixes an issue in MP_JOIN SYN cookie processing where the
> local_id was not restored from the saved cookie entry. By restoring
> subflow_req->local_id, it prevents the use of stale memory from previousl=
y
> freed request sockets.
>
> > diff --git a/net/mptcp/syncookies.c b/net/mptcp/syncookies.c
> > index 7f22526346a7e..b5cac57011221 100644
> > --- a/net/mptcp/syncookies.c
> > +++ b/net/mptcp/syncookies.c
> > @@ -118,6 +118,7 @@ bool mptcp_token_join_cookie_init_state(struct mptc=
p_subflow_request_sock *subfl
> >       subflow_req->local_nonce =3D e->local_nonce;
> >       subflow_req->backup =3D e->backup;
> >       subflow_req->remote_id =3D e->join_id;
> > +     subflow_req->local_id =3D e->local_id;
>
> [Severity: Medium]
> This is a pre-existing issue, but do we also need to initialize request_b=
kup
> and thmac here to prevent similar stale memory leaks?
>
> It looks like these fields are not stored in the join_entry struct during
> mptcp_join_store_state(), and therefore remain uninitialized in
> mptcp_token_join_cookie_init_state().
>
> Since the request socket slab is SLAB_TYPESAFE_BY_RCU and not zeroed, doe=
s
> this cause uninitialized stale data to be copied into the new subflow con=
text
> when the child socket is cloned?
>
> net/mptcp/subflow.c:subflow_ulp_clone() {
>     ...
>     new_ctx->backup =3D subflow_req->backup;
>     new_ctx->request_bkup =3D subflow_req->request_bkup;
>     WRITE_ONCE(new_ctx->remote_id, subflow_req->remote_id);
>     new_ctx->token =3D subflow_req->token;
>     new_ctx->thmac =3D subflow_req->thmac;
>     ...
> }
>
> Could this lead to state corruption for the path priority or uninitialize=
d
> memory access warnings if those fields are accessed later during packet
> scheduling?
>
> >       subflow_req->token =3D e->token;
> >       subflow_req->msk =3D msk;
> >       spin_unlock_bh(&join_entry_locks[i]);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811215135.87=
756-1-harshitvaru666@gmail.com?part=3D1
