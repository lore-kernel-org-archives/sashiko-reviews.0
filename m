Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060401;
	b=3c2kAe+Kz6w71zvBiETFP2AkZzoVrnBAm3R8iFe/7EwFNso7tiB6bh0TiAobKmvPNbe9
	 yU5ySYkJ3DBwQzgln+oVK9InFV2FmpqDy769cplZ6q23zHet0FMpfOwcc94BKvasnGCIf
	 ppj4WKFNuglbvZD+RkTOY/a1LyJ2nZbuNr94g5czvsVftfaFlVWYJMwttCwgebZSD+ANO
	 yQNTURJIwCrvWkLn/5gOKhVlbVfKszf23WEaXwBEAGSRWPI8AcUvPpotRMUtwPZFUEqaV
	 zyip8NtkxKEsdUbc38K1s8KjMsvOR0FOyfV6k2wsVxDrQnXJPrSAYVZb+Iw6Ngb05rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060401;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dRnWoULI3173Yqo58sHLTgXHS+AEuN9ho2xS9PVuhns=;
	b=jYUUUnTSQNCAqcIUt55J8cTfwNmtKGi9pFh/ZusyO5IRBN8HIWFmXpq3as5JOy7Hd9K5
	 mjIJE9bpRryEWnLyU63pASKHWNIXXEPgGnqJ+563ozoP0QdypTdO9Nj5yK7Intce9+sBw
	 bQAXytZ7ZQr+wbeYTx6k6JV+LMTxHOFjkIaN8yvi1Gl3ObcKzk3PHnDtgRnq/HJhsMTm4
	 VpWA4UOPTgHWCckS4ONNEE/6XQZH/4uWqfZxkJdmU2rbP9AEvKb+Yfmb/3Tc8natpyY27
	 7EHK4pcvLwwNUDu5CKIoHTPFqn0c+t67X1BTXRS8d6HtAX163nzqI8n///3O2t7pgUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0khYycu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3EC606D81A;
	Sat,  7 Nov 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0khYycu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D691F008A2;
	Sat,  7 Nov 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060401;
	bh=dRnWoULI3173Yqo58sHLTgXHS+AEuN9ho2xS9PVuhns=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=P0khYycugzxtI0Lt9BtiBnM8SaNf4JAMZ8ziljyH2ARuzvwx/eHbaNVoo3zDV59mB
	 1q7IIfXEk1V0UyzsicknUI5WrHjZQhZRef8hGC23238SwLLggWcOdxWzY3ftgX4h7i
	 xPRR1mS4t32Fa+v3w1zsJdXbefofFeMWTwzfJaMNYQ2iQhWILgA/wBwGkNZoStpmqB
	 RPxZB7fUnIVPsM6UvG7WPAfyjTWy7jsZVq3nly9BYlS24yW2/chfnCyLC1GNXppMxs
	 Lk/8GFjnxqBmrWuvb1AGiMBVU+9uMmLMxsmcwcSbFjy0newQejWaK7VnYDaz2qjh9b
	 SF3NvEZcnlXtw==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v24 09/15] media: qcom: camss: csid: Add support for
 CSID 1080
From: bod@kernel.org
To: sashiko-reviews@lists.linux.dev
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, 
 neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <sashiko-outbox-193308@kernel.org>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-9-d6b8f3f6f66f@oss.qualcomm.com>
 <sashiko-outbox-193308@kernel.org>
Date: Sat, 07 Nov 2026 14:06:36 +0000
Message-Id: <179406039659.650304.183461297349639175.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9352; i=bod@kernel.org;
 h=from:subject:message-id; bh=fWXNSKxBlQ8AhlCFWFSjAP9CzDVqSO9hadN9LWOv0v4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7zBu8ihuhOEt+7vTL8KFSjeCNLDqxtTQFtbEE
 4O0G6XApW6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau8wbgAKCRAicTuzoY3I
 Ou5fEACQUWQe9sN6OIK6/ZEBFckX7hxFDwmI6hS9rOZK9WGHVgVnvmhLkKjuZySLSVf1ItUg0qf
 ul7Jhs3c8iwzRj0E0fLBRamsAUFGzCe0QXfyamfUydd6MN0u/p2sdhgAqQLZwXaz50dWVKWaCj5
 GeKHTWAthT8+qj8dXZwQdbFo4suK4xpp4knYZRpXeGm7tTDO1vanmbtWhjl7tis1Wclw+9eT68E
 byBBVflPBY/Z77vPuOp09yQT40EyW2SRpaxDvZoJpz+L1vkyWQBdLaU54L0SjzEA/Zsxdvj+bfI
 jAqeEuQd8uiTdxRmtVKyoi7Qgnfs7KWc/Y5FjCefb1lQgY3a+kmZdapXibHGAwd/bzSt6WbYe/4
 6a2DrgXwI4jsNoPTIWjW8CmeyvKPyuTFOtv4tdrQ4KH+NKeAQ4TnqRKXAZG7NKPBOVopcF7NAPu
 w9A6Mw/weDtsugjyEmvT0MroX3xM6LCdsZW8t4c4eyv5uFAgX/7Csvckj+WT2XDSdtfI4Z+U0HM
 DUgyysosBINauTtKNPadI+7FwAyzfgN0ODYOO2kOTEoS9ErlhjHHwYkSe4YzTKHF4ctck+xP2Gd
 K23jFNpUK2zE1QjH2FyUaMklEg32Gj44QHqJBKsPKPddleqATgBzYhGWMpPjDhsbA9g/Pj+mqEO
 sZ9hV25Rc8MFXDQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-02 11:02 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] media: qcom: camss: unconditional AUP triggers in csid_configure_stream()
> - [Medium] media: qcom: camss: out-of-bounds csid->fmt access in __csid_configure_rdi_stream()
> - [Medium] media: qcom: camss: race on addr_update and reg_update in csid_isr()
> - [Low] media: qcom: camss: unused variable lane_cnt in __csid_configure_rdi_stream()
> - [Low] media: qcom: camss: malformed kernel-doc Return sections in camss-csid-1080.c
> --
> 
> commit b46b9d6d26210a3faaa024307adfd55c2501ce00
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csid: Add support for CSID 1080
> 
> This commit adds hardware resource descriptions, register programming,
> reset handling, and interrupt support for the CSID 1080 module found on
> the Kaanapali SoC.
> 
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> > new file mode 100644
> > index 0000000000000..3d90d31201fa5
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> > @@ -0,0 +1,402 @@
> 
> [ ... ]
> 
> > +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)
> 
> [ ... ]
> 
> > +static void __csid_aup_rup_trigger(struct csid_device *csid)
> > +{
> > +	/* trigger SET in combined register */
> > +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> > +}
> > +
> > +static void __csid_addr_update(struct csid_device *csid, int port_id)
> > +{
> > +	csid->addr_update |= CSID_RUP_AUP_RDI(port_id);
> > +	writel(csid->addr_update, csid->base + CSID_AUP_CMD);
> > +
> > +	__csid_aup_rup_trigger(csid);
> > +}
> > +
> > +static void __csid_addr_update_clear(struct csid_device *csid, int port_id)
> > +{
> > +	csid->addr_update &= ~CSID_RUP_AUP_RDI(port_id);
> > +}
> > +
> > +static void __csid_reg_update(struct csid_device *csid, int port_id)
> > +{
> > +	csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
> > +	writel(csid->reg_update, csid->base + CSID_RUP_CMD);
> > +
> > +	__csid_aup_rup_trigger(csid);
> > +}
> > +
> > +static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
> > +{
> > +	csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
> > +}
> 
> [Severity: Medium]
> As reported by Sashiko on v14 [1], can concurrent updates to
> csid->addr_update and csid->reg_update race between process context and
> interrupt context?

I agree here. I think the spinlock for reg-update, needs to be held.

Since the reg-update spinlock guards the entire slew of shadow bank
registers - or rather it should it looks like this lock is warranted and
missing.
 
> In __csid_addr_update(), __csid_addr_update_clear(), __csid_reg_update(),
> and __csid_reg_update_clear(), the bitmasks in csid->addr_update and
> csid->reg_update are modified with non-atomic |= and &= ~ operations, and
> the full multi-port mask is written to CSID_AUP_CMD and CSID_RUP_CMD.
> 
> While vfe_queue_buffer_v2() and vfe_enable_output_v2() invoke
> csid_subdev_addr_update() and csid_subdev_reg_update() under
> vfe->output_lock, csid_configure_stream() calls __csid_addr_update() and
> __csid_reg_update() without a lock, and csid_isr() clears those fields via
> __csid_addr_update_clear() and __csid_reg_update_clear() before
> camss_buf_done() acquires vfe->output_lock.
> 
> In addition, within csid_isr(), camss_buf_done() is called for port i
> before higher-numbered RDI ports have had their INFO_RUP_DONE status
> checked and cleared in the loop, so a buffer update triggered from
> camss_buf_done() on port i can re-write CSID_AUP_CMD and CSID_RUP_CMD
> with stale bits still set for those higher-numbered ports.
> 
> [ ... ]
> 
> > +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
> > +{
> > +	u8 lane_cnt = csid->phy.lane_cnt;
> > +	u32 val;
> > +
> > +	/* Source pads matching RDI channels on hardware.
> > +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> > +	 */
> > +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
> > +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> > +								   csid->res->formats->nformats,
> > +								   input_format->code);
> > +
> > +	if (!lane_cnt)
> > +		lane_cnt = 4;
> 
> [Severity: Low]
> As reported by Sashiko on v23 [2], lane_cnt is initialized and updated in
> __csid_configure_rdi_stream(), but it is never read anywhere in the
> function. Will this trigger an unused-but-set-variable compiler warning?
> 
> > +
> > +	val = RDI_CFG0_TIMESTAMP_EN;
> > +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> > +	val |= RDI_CFG0_RETIME_BS;
> > +
> > +	/* note: for non-RDI path, this should be format->decode_format */
> > +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> > +	val |= vc << RDI_CFG0_VC;
> > +	val |= format->data_type << RDI_CFG0_DT;
> > +	writel(val, csid->base + CSID_RDI_CFG0(port));
> > +
> > +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> > +	writel(val, csid->base + CSID_RDI_CFG1(port));
> > +
> > +	/* Configure pixel store using dedicated register in 1080 */
> > +	if (!csid_is_lite(csid))
> > +		__csid_configure_rdi_pix_store(csid, port);
> > +
> > +	val = 0;
> > +	writel(val, csid->base + CSID_RDI_CTRL(port));
> > +
> > +	val = readl(csid->base + CSID_RDI_CFG0(port));
> > +
> > +	if (enable)
> > +		val |= RDI_CFG0_EN;
> > +
> > +	writel(val, csid->base + CSID_RDI_CFG0(port));
> > +}
> > +
> > +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> > +{
> > +	u8 i, k;
> > +
> > +	__csid_configure_rx(csid, &csid->phy);
> > +
> > +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
> > +		if (csid->phy.en_vc & BIT(i)) {
> > +			__csid_configure_rdi_stream(csid, enable, i, 0);
> > +			__csid_configure_rx_vc(csid, 0);
> 
> [Severity: Medium]
> As reported by Sashiko on v14 [1], can __csid_configure_rdi_stream() index
> past the end of csid->fmt[] when i reaches 4?
> 
> For non-lite CSID 1080 instances, MSM_CSID_MAX_SRC_STREAMS_1080 evaluates
> to 5, so csid_configure_stream() iterates i from 0 to 4 and passes i as
> port to __csid_configure_rdi_stream():
> 
>     struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
> 
> However, in drivers/media/platform/qcom/camss/camss-csid.h,
> MSM_CSID_PAD_FIRST_SRC is 1 and MSM_CSID_PADS_NUM is 5 (1 sink pad and 4
> source pads), sizing both csid->pads[MSM_CSID_PADS_NUM] and
> csid->fmt[MSM_CSID_PADS_NUM] to 5 elements (indices 0..4). When port is 4,
> MSM_CSID_PAD_FIRST_SRC + port evaluates to 5, which is one element past
> the end of csid->fmt[].
> 
> > +
> > +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
> > +				__csid_addr_update(csid, i);
> > +
> > +			__csid_reg_update(csid, i);
> 
> [Severity: High]
> Does unconditionally calling __csid_addr_update() CAMSS_INIT_BUF_COUNT (2)
> times here match the buffers actually programmed in vfe_enable_output_v2()?
> 
> During stream startup, vfe_enable_output_v2() in
> drivers/media/platform/qcom/camss/camss-vfe.c only calls
> ops->vfe_wm_update() for buffers actually present in the pending queue:
> 
>     for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>         output->buf[i] = vfe_buf_get_pending(output);
>         if (!output->buf[i])
>             break;
>         output->gen2.active_num++;
>         ops->vfe_wm_update(vfe, output->wm_idx[0],
>                    output->buf[i]->addr[0], line);
>         if (!ops->addr_update)
>             ops->reg_update(vfe, line->id);
>     }
> 
> If userspace starts streaming with 0 or 1 buffer queued (or when
> csid_configure_stream() is called with enable == 0),
> csid_configure_stream() still triggers two AUPs and one RUP, which can
> latch uninitialized or duplicate WM buffer addresses into the hardware
> FIFO. Even when 2 buffers are queued prior to stream-on,
> vfe_enable_output_v2() writes both buffer addresses to the WM register
> before any AUP is issued.
> 
> > +
> > +			__csid_ctrl_rdi(csid, enable, i);
> > +		}
> > +	}
> > +}
> 
> [ ... ]
> 
> > +/**
> > + * csid_isr - CSID module interrupt service routine
> > + * @irq: Interrupt line
> > + * @dev: CSID device
> > + *
> > + * Return IRQ_HANDLED on success
> > + */
> > +static irqreturn_t csid_isr(int irq, void *dev)
> > +{
> 
> [ ... ]
> 
> > +}
> > +
> > +/**
> > + * csid_reset - Trigger reset on CSID module and wait to complete
> > + * @csid: CSID device
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> 
> [Severity: Low]
> This isn't a bug, but the kernel-doc comments for csid_isr() and
> csid_reset() use "Return" instead of "Return:", which causes
> scripts/kernel-doc to warn about a missing return value description under
> W=1 builds.
> 
> [1] https://lore.kernel.org/r/20260601162737.8D2531F00893@smtp.kernel.org
> [2] https://lore.kernel.org/r/20261028-kaanapali-camss-v23-9-95f250b18612@oss.qualcomm.com
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=9
> 


