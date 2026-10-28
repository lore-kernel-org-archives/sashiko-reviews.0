Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793194460;
	b=msOrgznqqwg6VuusEp773csiPJhc1Ym8hQPNnUZ2ebE5kswqLrQv9VVr1YZrbjo50aZA
	 eJZ/8TcCdL4QMPay1fBvVNnU2/NAjT/FlkZ8X3r+5Y+ONjgEUo+uP7/JL6AQzGn+Z+OV9
	 Pgm4XvVr3JyXDGZlx5VJH+Df+JSAIP/5ucubh8b3blxdbJ5Y209f/qziuDuR8nitVQEt9
	 fULrBvwZi6aKobuigMNcamu1RwtSJiKyf36Ruaga35VqSkQ1U9P67N084tg+OWfivuvpN
	 QKe6VBwIr9inRCTF15tSmvKATkfGYNvhy9q9WciSbNAc5h7SMXw3bOshT+nkMKhvoGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ee4OtoDdUVVMPj/wc6rKMnSoGu+WOHUA0z+EnvP+fWM=;
	b=HQCeOnfh/82e8S+/c1uaj6G/YKxExrBKT4ZkfDj+hPVeSy3GpRTIPqHrZcTSQuDqEwAt
	 NbSxW6WrQZiXRT28tRz7trJWDQas0hlgGyPEUNIzmZVuF+BtGmI0D58etTyrbCzNHxhJR
	 1jZlVFwED6LUximK+Ikw6+m/VaniDYERk9HTTty/vcQUs1jM7FfqJSIwg4EKL3qns8kC3
	 6e37ovNuuBcUH0OD+xPQezUfS/2+bn8oGfTFOTI1nmYy8MfTzfSaOxOp4P/fH07U6QgoN
	 hp7dW1DhmRCaJXoOIXDE2S8roR8qP5cjEVChxF+I7euvc+0jeWdl4fR/+mfdUC2Phow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=YJdjRVJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62328606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 13:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62328606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=YJdjRVJS
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1747096a12.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 06:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793194459; cv=none;
        d=google.com; s=arc-20260327;
        b=fA1ozgBE5p3nerENjSXdCi6bXf2nRZWXfTSkOSCcXOgN72VXtlGEDngCaeCT3go+Of
         6EUulKbNuNm7tN27iniy3i/hH/6vpFAf4A0F1ii/LE5egusnVExnvpwOAW0TYn2rcfXr
         dovtqPIPrIvTqzG8nP1C1I4vgKaRbOTX0xP1dHn3XU5oC7Ic4iE7stzzs0CoXpIJ9S6j
         jTdI43px05KhLYljhCo4Mepz/tE68/+w8OFHaGmW0X0iCngOt3VzmxE6oj66QiUz4mVR
         niSZzRsswp+HoMGN8aaI1Y4pAZ2YURRfeEGTS8huuwJ9y1FoGOzipiO7g+BxpCZu+n8X
         D4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ee4OtoDdUVVMPj/wc6rKMnSoGu+WOHUA0z+EnvP+fWM=;
        fh=gUfsL9ppqjROwdjOOpA7gVU01au1qshFQ+BhECdF0Kg=;
        b=YCX9ngzZaR2Mm6I3mvJUoopIRZw0mSxXViTjsTTMUDPKzXpfK4DJ2T4TNFDAmm8T4z
         oiLVqws9SBHZFwRremU7NKLcjE8b4UrH53eC06IKuMoudjuBHhugegS8nt5KK3a03bDS
         jgcNJ68hQyDMbIxpYDT5IiKpoPQLefO6VdKUaoDUpfhrCcP210sa8Km7i+5I70Yscqdm
         Fo+HHcKQg9Qj0J0kSkWt28hA1lUsiCVTGFpBp3LsWefmXxRwgpY/x5UEA1kmrn2tTyzw
         VGughUEBpyrabkQGa+TdfDPu0TETAAvb9e2JzrYdB8+casmZicKVk8jwD5MYKUG77peN
         Pf9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793194459; x=1793799259; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ee4OtoDdUVVMPj/wc6rKMnSoGu+WOHUA0z+EnvP+fWM=;
        b=YJdjRVJS1169F42Laj19lC2o6oLq++1yT6rXzALaGdYuyRM0LbdbHvR2XrO5t9zCRp
         clJB+Yv4SXfcwssaYzN1libnWWupYLW2gw9pRJbKVSm8niQ34ERVVYCFMAbiRhw69Ydy
         ukpJXWidaaseM3S229to6+CF7bgpN5m4n8YcyY0UVGfNPR+3hBHj5mvS4OwLPAjW/tCs
         LDy6L33v8rUns2DOwdIHQCcwLqZ+xeCDpnKTzBCa+BbxZk5c3d8JI18OvNHqBumtNzzo
         3GxLpIjgpgOSVjJkNZfbuslNdDkc9xcBlauHSePW62WFjmWjs1j+/cr/d4yV2lDkiBXe
         RJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194459; x=1793799259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ee4OtoDdUVVMPj/wc6rKMnSoGu+WOHUA0z+EnvP+fWM=;
        b=OMdFuIiR/7/pO9EzZPvxmPUEHOaKnqNr6CDE07aZPIJydsNT2DMoeOE+fJgmbcH8jD
         k4TX18CrA4OXoIk+QI+/iigfXwD1c7q+I5lTYc//7omGVZ7UwPUPjqklXpbSWZxCsjgc
         mGxWS4IpA1UMPlu/OStvMbmkflscOJ1yU9FxPv2gOsCNIwSELG6SNDX4JL+cineRCgRU
         u2iHT8Qo+yRUvmiOBRUXAfAH9FMIjMJ4UU3knIwHguSe1hZTI5yc04f12cm1Ml2E1mJ9
         z0COnyfkGuccXETFzOja/dURV6uHaCbSwpDByFQyv65J/SrwvLR3s9ycPLAaZRTN5Dub
         YJog==
X-Gm-Message-State: AFq9FYLXobjoobiaBeWjgRLX03inV0TW3xh6Qlq0xkWIO41P2XNsS9ce
	InQEbypdaxV8CF46J3Jf5wKmg7A9o1K0zuO6PTrmMvq9SPnXbV7ZHVnXeFipf7NWQOsY8h2GEmx
	hp7r+POp5yqsKuXB99QMiPmM7ugtxo76FSYa8tGdT7LsYy/iRt3C2iWNsew9S
X-Gm-Gg: AYBFou2WykUm/sCXvxRr9mjh2EslrtoIoNWju1cV6y0lNxNqUBpzHNiUe3SnZ81iPTs
	Tky8JmYXAsZw3M4JHKJZ8BtC5ldTQgjmcXJ9G4KHD3X7tIaGAChdlisrIL63G/oGVf7J1Evq6TM
	aI3VCQ+O92NdAs1dEdg4h3v4xgmk0x3l2k55hzlvThIJ1NLtzVkPx7rGOfwS8mGg+FR3BYjKzLM
	NeamhVAsfn29vmlhth0IpH3q2CN/CObeq7wjbgejkM/GfNsEdcZzK5aDEyzlcEekPTm0oQPJSF1
	73CUgT1mDL3F2SPYS0n8vR+390Zmmg219eDrc6fWwHZAYkUNv3fb2fNyQfST5SL8s7xuePqwUNc
	/lDdVH2JzGqlz4KXBXmyhLv7+aDH8yj/0++o8JWVzloq+X9j6i4BPdCx45f4ouo/wjmSM+7bKY4
	cDloF9H9qIl+1ErNQ=
X-Received: by 2002:a17:907:60d1:b0:c31:9a1c:de76 with SMTP id
 a640c23a62f3a-c49bdf389ccmr208900966b.14.1793194458590; Wed, 28 Oct 2026
 06:34:18 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028-biwin-tua-quirk-v1-1-767a12c9b9cc@flipper.net> <sashiko-outbox-187901@kernel.org>
In-Reply-To: <sashiko-outbox-187901@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 28 Oct 2026 17:34:01 +0400
X-Gm-Features: AclHuK84rdq1eh77fj4l7hk6VSAzgGvuEl-QASfPeiofUA5FndtFXoShRb4A-Pk
Message-ID: <CAKTNdwEGr-VSWUSPOQZO_Pr-i=Wm+jMaoHneMjmUbMJmihUJQw@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Clear power-on UNIT ATTENTION on BIWIN devices
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] scsi: ufs: unhandled broken OCS quirk in ufshcd_clear_unit_att=
ention()
> - [Medium] scsi: ufs: core: ufshcd_issue_devman_upiu_cmd() hardcodes lun =
0 in lrbp
> --
>
> commit 02e1f4aa450245801c780ec99fe1072a3f8e77c3
> Author: Alexey Charkov <alchark@flipper.net>
>
> scsi: ufs: core: Clear power-on UNIT ATTENTION on BIWIN devices
>
> This patch adds a device quirk for BIWIN UFS devices (models starting wit=
h
> BWU2A05) to clear pending power-on unit attention conditions across all
> logical units after a host reset and restore by issuing a TEST_UNIT_READY
> command via the device management slot.
>
> > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > index ee643830a57a2..d52275a813fd3 100644
> > --- a/drivers/ufs/core/ufshcd.c
> > +++ b/drivers/ufs/core/ufshcd.c
>
> [ ... ]
>
> > @@ -8265,6 +8268,55 @@ static void ufshcd_process_probe_result(struct u=
fs_hba *hba,
> >                         hba->curr_dev_pwr_mode, hba->uic_link_state);
> >  }
> >
> > +/**
> > + * ufshcd_clear_unit_attention - clear the power-on UNIT ATTENTION of =
each LU
> > + * @hba: per adapter instance
> > + *
> > + * Send a TEST UNIT READY to each logical unit to clear the power-on U=
NIT
> > + * ATTENTION left by a device reset, for devices that keep reporting i=
t to
> > + * WRITE commands instead. Receiving the UNIT ATTENTION is what clears=
 it, so
> > + * only transport failures matter.
> > + *
> > + * Use the device management slot rather than the logical units' reque=
st
> > + * queues: those are blocked during error handling, and during a runti=
me
> > + * resume of the device W-LU its runtime suspended consumers cannot ta=
ke
> > + * requests until it has resumed.
> > + */
> > +static void ufshcd_clear_unit_attention(struct ufs_hba *hba)
> > +{
> > +     struct utp_upiu_req req_upiu, rsp_upiu;
> > +     struct scsi_device *sdev;
> > +     int err;
> > +
> > +     shost_for_each_device(sdev, hba->host) {
> > +             if (scsi_is_wlun(sdev->lun))
> > +                     continue;
> > +
> > +             req_upiu =3D (struct utp_upiu_req){
> > +                     .header =3D {
> > +                             .transaction_code =3D UPIU_TRANSACTION_CO=
MMAND,
> > +                             .lun =3D ufshcd_scsi_to_upiu_lun(sdev->lu=
n),
> > +                             .command_set_type =3D UPIU_COMMAND_SET_TY=
PE_SCSI,
> > +                     },
> > +                     .sc.cdb[0] =3D TEST_UNIT_READY,
> > +             };
> > +
> > +             ufshcd_dev_man_lock(hba);
> > +             err =3D ufshcd_issue_devman_upiu_cmd(hba, &req_upiu, &rsp=
_upiu,
> > +                                                NULL, NULL,
> > +                                                DEV_CMD_TYPE_SCSI,
> > +                                                UPIU_QUERY_OPCODE_NOP)=
;
>
> [Severity: Medium]
> When ufshcd_clear_unit_attention() sends a DEV_CMD_TYPE_SCSI command to a
> non-zero LUN, ufshcd_issue_devman_upiu_cmd() still passes a hardcoded LUN=
 of
> 0 to ufshcd_setup_dev_cmd():
>
> drivers/ufs/core/ufshcd.c:ufshcd_issue_devman_upiu_cmd() {
>         ...
>         tag =3D scsi_cmd_to_rq(cmd)->tag;
>
>         ufshcd_setup_dev_cmd(hba, cmd, cmd_type, 0, tag);
>         ...
> }
>
> This leaves lrbp->lun set to 0 even though req_upiu.header.lun targets a
> non-zero LUN.
>
> If the command times out during error recovery (for example via
> ufshcd_err_handler() -> ufshcd_reset_and_restore() ->
> ufshcd_host_reset_and_restore() -> ufshcd_clear_unit_attention() when
> hba->pm_op_in_progress is false), scmd_eh_abort_handler() invokes
> ufshcd_abort() -> ufshcd_mcq_abort() -> ufshcd_try_to_abort_task(), which
> uses lrbp->lun to issue UFS_QUERY_TASK and UFS_ABORT_TASK:
>
> drivers/ufs/core/ufshcd.c:ufshcd_try_to_abort_task() {
>         ...
>         for (poll_cnt =3D 100; poll_cnt; poll_cnt--) {
>                 err =3D ufshcd_issue_tm_cmd(hba, lrbp->lun, tag, UFS_QUER=
Y_TASK,
>                                           &resp);
>         ...
> }
>
> And ufshcd_clear_cmd() -> ufshcd_mcq_sq_cleanup() also uses lrbp->lun to
> build the nexus written to REG_SQCTI:
>
> drivers/ufs/core/ufs-mcq.c:ufshcd_mcq_sq_cleanup() {
>         ...
>         /* SQCTI =3D EXT_IID, IID, LUN, Task Tag */
>         nexus =3D lrbp->lun << 8 | task_tag;
>         opr_sqd_base =3D mcq_opr_base(hba, OPR_SQD, id);
>         writel(nexus, opr_sqd_base + REG_SQCTI);
>         ...
> }
>
> Should ufshcd_issue_devman_upiu_cmd() pass req_upiu->header.lun instead o=
f 0
> to ufshcd_setup_dev_cmd() so that task abort and MCQ queue cleanup target=
 the
> right LUN?

Makes sense, I'll implement this in v2 after waiting for other feedback.

> > +             ufshcd_dev_man_unlock(hba);
> > +             if (err) {
> > +                     dev_warn(hba->dev,
> > +                              "TEST UNIT READY to LUN %llu failed: %d\=
n",
> > +                              sdev->lun, err);
> > +                     scsi_device_put(sdev);
> > +                     break;
> > +             }
>
> [Severity: Medium]
> What happens here on host controllers with UFSHCD_QUIRK_BROKEN_OCS_FATAL_=
ERROR
> (such as ufs-exynos)?
>
> When a logical unit has a pending unit attention condition, the device
> responds to TEST_UNIT_READY with a Response UPIU having header.response s=
et
> to TARGET_FAILURE and header.status set to SAM_STAT_CHECK_CONDITION. On
> controllers with UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR, hardware reports
> OCS_FATAL_ERROR in the UTRD/CQE whenever the Response UPIU has a non-zero
> response or status field.
>
> For normal SCSI commands, ufshcd_transfer_rsp_status() overrides ocs back=
 to
> OCS_SUCCESS:
>
> drivers/ufs/core/ufshcd.c:ufshcd_transfer_rsp_status() {
>         ...
>         if (hba->quirks & UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR) {
>                 if (lrbp->ucd_rsp_ptr->header.response ||
>                     lrbp->ucd_rsp_ptr->header.status)
>                         ocs =3D OCS_SUCCESS;
>         }
>         ...
> }
>
> However, ufshcd_issue_devman_upiu_cmd() uses a reserved device management
> command (!ufshcd_is_scsi_cmd(cmd)). In ufshcd_compl_one_cqe(), the reserv=
ed
> command path bypasses ufshcd_transfer_rsp_status() and leaves
> lrbp->utr_descriptor_ptr->header.ocs as OCS_FATAL_ERROR, which
> ufshcd_issue_dev_cmd() then returns directly:
>
> drivers/ufs/core/ufshcd.c:ufshcd_issue_dev_cmd() {
>         ...
>         rq->timeout =3D timeout;
>         sts =3D blk_execute_rq(rq, true);
>         if (sts !=3D BLK_STS_OK)
>                 return blk_status_to_errno(sts);
>         return lrbp->utr_descriptor_ptr->header.ocs;
> }
>
> Wouldn't this cause ufshcd_clear_unit_attention() to see OCS_FATAL_ERROR =
on
> the first LUN that reports unit attention, log a warning, and break out o=
f
> the loop before clearing the remaining LUNs?

It probably will, but this failure mode requires a BIWIN
BWU2A05-series UFS device on an Exynos host controller, which is not a
combination I have access to (I only have Rockchip RK3576 boards). I'm
not sure those even exist.

If anything, this should probably be fixed in the common
ufshcd_compl_one_cqe() function, not directly related to this patch,
because it would also affect similar pre-existing logic in the
Advanced RPMB flow.

Best regards,
Alexey
